class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "6.10.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.10.0/claudish-darwin-arm64"
    sha256 "4ab64fe1eaa16b8b25d2b360239dcd6062da96098e978faeeaaa419a8753ca2a"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.10.0/claudish-darwin-x64"
    sha256 "3ccf5e0c743a0acf10e63249a2ea8b5a5dcfd6232b1b7da4cd68cf98e4573f23"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
