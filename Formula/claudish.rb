class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.4.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.4.0/claudish-darwin-arm64"
    sha256 "33ee11d3f4a1702d49d7233631e033737f57cd6ecf4998338f4dae981ca26a33"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.4.0/claudish-darwin-x64"
    sha256 "4483a8314abbd8fc2835979da42cb53f529d902a228302c824bd3b31ba10ac68"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
