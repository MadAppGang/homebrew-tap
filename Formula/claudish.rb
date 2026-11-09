class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.18.2"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.18.2/claudish-darwin-arm64"
    sha256 "7ddc2ce722814e228a6780553f92f7e1644223fdf3eefd28a0b42912006abc02"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.18.2/claudish-darwin-x64"
    sha256 "316877076c05e60ba608685b0f7564c297106fe4a4134db8f6d122fbc90b9616"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
