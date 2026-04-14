class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "6.13.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.13.1/claudish-darwin-arm64"
    sha256 "50db5de69da44ff67a77e07694cac725dfcad0638d4495a5ab6aad5e0452ca37"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.13.1/claudish-darwin-x64"
    sha256 "45bbcd070f42e3c8522c0b2eb5bc8ebf0dcbaa20ee981fe053019626a5af1f03"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
