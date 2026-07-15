class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.14.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.14.0/claudish-darwin-arm64"
    sha256 "9a73917d5a2d1b0170bdf817e75b9186dd61ad9c77a0360a1c49de404dbf1336"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.14.0/claudish-darwin-x64"
    sha256 "9ed6d4236394bf1b57e262a6d67e77a6e3ed4ca83b753817834d67fe02c39ca0"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
