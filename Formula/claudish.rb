class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.34.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.34.0/claudish-darwin-arm64"
    sha256 "68b10135c14f051e0b6ebdec1f82ad3565041ab01af48b83b4235a9b53e19208"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.34.0/claudish-darwin-x64"
    sha256 "ae5271043ac2fef41f2875c19ccd3f0eb34496e8591c1bdfcbf8f31f3ea47f1b"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
