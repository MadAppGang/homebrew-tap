class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.29.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.29.1/claudish-darwin-arm64"
    sha256 "8954bf38d85b35549b3099212d720a22e770224fbf807cad8c9c793b905d1154"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.29.1/claudish-darwin-x64"
    sha256 "75598fcdf1af20319b6fcc9c8c4967a2bc5b4472fb467e4bea4178c20a0fb2ff"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
