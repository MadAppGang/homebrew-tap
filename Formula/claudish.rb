class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.11.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.11.0/claudish-darwin-arm64"
    sha256 "42422604b4d0b5de1c30c605f5d9a86e43ca00219a63f8b0e1c22edc1cfa4d0b"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.11.0/claudish-darwin-x64"
    sha256 "93833ff6706f44496d06e5a8e01831849a9bb00164c22628605502af64a8483b"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
