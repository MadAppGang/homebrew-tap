class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.16.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.16.0/claudish-darwin-arm64"
    sha256 "04a4894c26a640739089341f76befa2c316be69498272fb2fd851b0838355792"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.16.0/claudish-darwin-x64"
    sha256 "567c58f89b8ece3394bbdceb49c6a232e8ac373a5876712281facfa3f94d896b"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
