class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "9.0.9"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v9.0.9/claudish-darwin-arm64"
    sha256 "8e539c906c3ba3fe27b4fd6b37d4f89068932eddb79372dae7f2caa560ddcd9b"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v9.0.9/claudish-darwin-x64"
    sha256 "3ee461a5fab06dd6462472747bced39c0fddb85ad2d4057fedd4343340f5eca7"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
