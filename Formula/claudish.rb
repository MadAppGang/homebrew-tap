class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.12.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.12.0/claudish-darwin-arm64"
    sha256 "9f2c6d9e57129773b6fed17cad3b6cdc391070ccc59438098bdeadf35491ddf1"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.12.0/claudish-darwin-x64"
    sha256 "0459b56c8b46ed07d6f6953bce4e81b71d6e53d8df025986861adedbf077cbf4"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
