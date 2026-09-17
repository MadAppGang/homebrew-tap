class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "9.6.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v9.6.0/claudish-darwin-arm64"
    sha256 "46d2bb299322b356fcba9c7c11220d26380d49c9842f83c037755b976d66423a"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v9.6.0/claudish-darwin-x64"
    sha256 "76d43b1d5556d6f814d899a62c8fc2c796778f0be1df17461ceedc835c96317b"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
