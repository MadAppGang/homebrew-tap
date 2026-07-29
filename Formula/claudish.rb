class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.21.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.21.0/claudish-darwin-arm64"
    sha256 "9e4a81950d1e07895200ba8b71d1742ad22d001be831d04fef376351fb3c7cdd"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.21.0/claudish-darwin-x64"
    sha256 "8cbc5eb9addbc323d3ba4b068caf198c176ae8f101caf643e24c5750456c75b8"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
