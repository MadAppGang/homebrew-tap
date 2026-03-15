class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "5.11.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v5.11.0/claudish-darwin-arm64"
    sha256 "2e45a70d8a4ec940a818d03ca1493ce92d39291c8c7570043f32bec1c310c9c6"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v5.11.0/claudish-darwin-x64"
    sha256 "b01e1b2af5365a4a21290a02494164d7fcbcb462d4a5db303c2341f933861f46"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
