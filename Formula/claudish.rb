class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.57.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.57.0/claudish-darwin-arm64"
    sha256 "8aaceb00ebbea10d139c70e3ffb53fa41d03cc35cdc93087205d85755388a435"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.57.0/claudish-darwin-x64"
    sha256 "278e49dc53159ae52fb7de3a6a5d19c6a40f178943fa5a65a51b2946572cbbaa"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
