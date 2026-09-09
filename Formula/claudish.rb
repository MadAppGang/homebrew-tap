class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "9.1.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v9.1.0/claudish-darwin-arm64"
    sha256 "49a9bd6c7fffb56c9ecc518ad67f690cebdb1386f24259a10bc716d182d181da"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v9.1.0/claudish-darwin-x64"
    sha256 "0c010cfebcedfe25ec2c12711f555e7719a2cfee198bc6f4aa7e14de9e7d2444"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
