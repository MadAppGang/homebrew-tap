class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.19.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.19.0/claudish-darwin-arm64"
    sha256 "d8bce9e4630216d6ec34a2cb3aa6a119a16775ada190125b24e977b9cbd9edc1"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.19.0/claudish-darwin-x64"
    sha256 "556872c1d0a2d1e8c115948e5e6d26609eed38402bf465db5e245efb74956d73"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
