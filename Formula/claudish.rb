class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.25.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.25.0/claudish-darwin-arm64"
    sha256 "46606ec844c4f5043163a223d2fc0ff42fc5ffc809a9651e45661a5a564e8d1d"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.25.0/claudish-darwin-x64"
    sha256 "955d0ff2499162d6f842c5dc14d7a46b145dbbe338b2b86f1d35cb79f9173367"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
