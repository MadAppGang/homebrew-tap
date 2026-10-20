class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "12.1.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v12.1.0/claudish-darwin-arm64"
    sha256 "7d6af5b0bb9f567079d8a5a8da0654162e7b2e29f15a2fa7e24836b2447cacb5"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v12.1.0/claudish-darwin-x64"
    sha256 "499117067f5ef310690ad1be02179d80b61dc67c9ac773dbb8abbe8f1dbf2f79"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
