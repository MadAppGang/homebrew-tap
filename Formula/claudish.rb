class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.66.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.66.0/claudish-darwin-arm64"
    sha256 "75b31b6bcc0b05ffdd492c12faa00f9b17214a1098d0f430696553d48c89559b"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.66.0/claudish-darwin-x64"
    sha256 "4b00a9382cd2a073ce2bfed148c2ac4e51c11e04329768901a3c35e587d28e4d"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
