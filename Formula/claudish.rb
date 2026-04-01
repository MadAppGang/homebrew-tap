class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "6.5.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.5.1/claudish-darwin-arm64"
    sha256 "4e7841550d16b7cbb3f0b8033be351b34f91fb50ac4d3f5b7f76686df40f9746"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.5.1/claudish-darwin-x64"
    sha256 "00925c687a344dbdb97d2a7afcfef414e6c1453ae91f69ddf42354854a7d2748"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
