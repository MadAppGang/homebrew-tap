class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.14.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.14.0/claudish-darwin-arm64"
    sha256 "dab991d985f3d53e9711935df9e02a1b2b53c6681f9ea7e7f50b633d725b1093"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.14.0/claudish-darwin-x64"
    sha256 "c00b8a265354e1e4b32fb567c185da47eaa2b52792d8aeee68fa94de9a1a4555"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
