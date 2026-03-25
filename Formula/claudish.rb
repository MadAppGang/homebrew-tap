class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "6.3.2"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.3.2/claudish-darwin-arm64"
    sha256 "3407a2d800c16b4546c06de2f4caaa0f8f5290fd980b7b41e46c606039e73128"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.3.2/claudish-darwin-x64"
    sha256 "f8ffce5d8d17aa214507fb72a9dde8b113092ca1be5580402c17e4e4b42bd283"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
