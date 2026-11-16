class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.27.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.27.1/claudish-darwin-arm64"
    sha256 "b6246d630eaf37b8003c1ceb2e4ef68b7b291f71b578f73be281e0a80fa2e5ac"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.27.1/claudish-darwin-x64"
    sha256 "cfa7990d8c31a6e452791e54a01efe7884b1c8fbaa2605d512acd23f2d22422b"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
