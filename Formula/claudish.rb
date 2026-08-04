class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.33.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.33.0/claudish-darwin-arm64"
    sha256 "bde7deb43c014bb7bdd628bdfe0f59a90895749a4a32e4a585a29f27a7ea9e31"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.33.0/claudish-darwin-x64"
    sha256 "b8f01031bc314be0afb1a371de1b1adf55b4c8205a9a9bc6a7df40adcf1be442"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
