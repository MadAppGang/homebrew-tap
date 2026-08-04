class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.29.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.29.0/claudish-darwin-arm64"
    sha256 "59bcd96377f4d96fe8e7199665cd9bb2e74eb660dc4f1bfb97fbaada9e7b3a0a"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.29.0/claudish-darwin-x64"
    sha256 "415136d2e5cb12ae19abaa40a219075f01a1df235c1cc6beed19ea526b5f4adf"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
