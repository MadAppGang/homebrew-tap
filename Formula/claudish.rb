class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.64.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.64.0/claudish-darwin-arm64"
    sha256 "87e7b226c179f80a218015829e0c1405d65882ed6cca3edab6754ded82f07e86"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.64.0/claudish-darwin-x64"
    sha256 "7b353bd567b3cca3ad0b211f653c2b15f437100e8d84d3cb65b675e3cf1a2d70"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
