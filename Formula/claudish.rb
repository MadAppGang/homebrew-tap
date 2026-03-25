class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "6.3.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.3.0/claudish-darwin-arm64"
    sha256 "d2fff420443d5f580b11c8ddf5e79d3f919bd2de7f6c882b71b8eff91345b52f"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.3.0/claudish-darwin-x64"
    sha256 "639271cdc7478174d22a0f66d1940644b65ba7d0a74a0388ada43cab106fcc8b"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
