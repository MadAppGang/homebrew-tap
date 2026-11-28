class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.29.3"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.29.3/claudish-darwin-arm64"
    sha256 "f8a29ae2eb5fed6d4498dda42167478f3a0e5a64581b12c9862e855823cf3879"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.29.3/claudish-darwin-x64"
    sha256 "feb5fde711a20eea17c1a6e30df82af8679db3e4b8f19a887aa722272aca754f"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
