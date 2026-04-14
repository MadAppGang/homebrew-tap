class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "6.13.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.13.0/claudish-darwin-arm64"
    sha256 "aea041983d958a20ec12f0029fe25d84979362db34299d8f5ca12d029287a485"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.13.0/claudish-darwin-x64"
    sha256 "a71f04ac0c940615bf7302284fac235bd864d0cef4d403b10562a737535e0fdc"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
