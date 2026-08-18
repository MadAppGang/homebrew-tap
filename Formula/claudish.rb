class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.54.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.54.0/claudish-darwin-arm64"
    sha256 "a7b1be8afd206009c711f0a2429ecc5d95cfea14c1f4e0b9b5976fc75b011e5a"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.54.0/claudish-darwin-x64"
    sha256 "59799602821fd42db33057ddeb7b42ac7d7d4238f4ff40db6e2106d467d5bbe1"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
