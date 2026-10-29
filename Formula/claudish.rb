class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.9.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.9.0/claudish-darwin-arm64"
    sha256 "716d60d88c27c5e95dac901724ccc6dd58f0d37f8167b1d6552c3d0c723f71f2"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.9.0/claudish-darwin-x64"
    sha256 "59c54112b97d5d7f8e2ac74e1391ecf884f7dba05939cfbc073b182892ff121b"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
