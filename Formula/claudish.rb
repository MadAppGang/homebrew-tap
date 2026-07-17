class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.15.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.15.0/claudish-darwin-arm64"
    sha256 "e5c67c8d6298aee214d06446e6d2cc242dc8347bfca46e66e2b2122eb4348aec"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.15.0/claudish-darwin-x64"
    sha256 "eb911311519669ac642af96e4e29dcdd39cefd7e5785a50e7d47f25be04e3fe7"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
