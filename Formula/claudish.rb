class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "6.11.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.11.1/claudish-darwin-arm64"
    sha256 "90d85139f6b745323cded8389131c020021551a3cf4db6ceb6282d5af1068691"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.11.1/claudish-darwin-x64"
    sha256 "30fadd3d4fc48334b19c893ad3715a0e518960135cb7eceb6ccbee7385bb288e"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
