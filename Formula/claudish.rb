class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "6.2.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.2.0/claudish-darwin-arm64"
    sha256 "41c549678f43a1ddab198a1b44fdd579f2f968bfbd900f337f8fc65b56542bfd"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.2.0/claudish-darwin-x64"
    sha256 "75d27454ccfa7b09cfa81af20359ccc1a45d879c0ffd9c5cd6a76ab3efee3cce"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
