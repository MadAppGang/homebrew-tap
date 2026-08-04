class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.35.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.35.0/claudish-darwin-arm64"
    sha256 "7cca31334de6ea56e3b38ef8a869dc54c43943e45e9854cd58d9fa0f1aab0ab2"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.35.0/claudish-darwin-x64"
    sha256 "f04020a8456ad32633c6d075dbff097fa8d5eb64105e231b352047036bfea749"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
