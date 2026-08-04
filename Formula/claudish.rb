class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.32.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.32.0/claudish-darwin-arm64"
    sha256 "101420fe1aa8d82225031244541d4e48eb6fce2c43b8f6966bfb6272c019fb6b"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.32.0/claudish-darwin-x64"
    sha256 "5255ebbbedf1b43501a01040ee5658356346784e47d84756b5fcb31fcf8ab816"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
