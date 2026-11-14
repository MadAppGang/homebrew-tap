class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.24.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.24.0/claudish-darwin-arm64"
    sha256 "773079132846a8bd7d9e7d745079a1f8be45f48f3e1801397d9fb599049892c1"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.24.0/claudish-darwin-x64"
    sha256 "882185f18f8a0b7f42c0bf79708db90eaa0a11087f148497583f50f107508717"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
