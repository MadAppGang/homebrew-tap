class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "12.1.2"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v12.1.2/claudish-darwin-arm64"
    sha256 "b43152e488e965eb5623f473078d7b9f6a2e1a2116085b2cf27430533e97ee80"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v12.1.2/claudish-darwin-x64"
    sha256 "9a9e4f02fd868a3e087468942b98e3692435af77c28fb0492eb5a4acddc94c76"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
