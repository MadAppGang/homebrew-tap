class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.0.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.0.1/claudish-darwin-arm64"
    sha256 "0580c618328b38be680c839a175274cd54dc70a9096953ac71b9b38d4288012e"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.0.1/claudish-darwin-x64"
    sha256 "ad07191e3dffe93b84c07ecc414a046697693e70f60628a20fe4c72db07e2607"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
