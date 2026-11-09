class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.18.3"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.18.3/claudish-darwin-arm64"
    sha256 "bd6944ff7ace48eac09624c8caaa8afba97ce4066e0b1da3bd8a00199943d36c"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.18.3/claudish-darwin-x64"
    sha256 "521452bacc700d716c451566c0e90463ab979eb7c8a06f5a5ed9e54fb19b2a16"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
