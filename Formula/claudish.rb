class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.23.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.23.0/claudish-darwin-arm64"
    sha256 "a93d2d90ddcfd27a0835cfbc1329b3eedb7bcbdfa28fa96e79fc982cdb9e3c51"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.23.0/claudish-darwin-x64"
    sha256 "acf7e327d69bea737d49ec821dae6b71f35c08f43cdf8d3b8db4598d3bcd2891"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
