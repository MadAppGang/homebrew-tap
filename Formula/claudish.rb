class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.67.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.67.0/claudish-darwin-arm64"
    sha256 "b320647cb3415fb206220ca669312fe31d215252a4aa17c48f86c5a020d96379"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.67.0/claudish-darwin-x64"
    sha256 "7a3cd9c5ab0b99c87b5128bed9ecc521ba7d5f9fd70833ea78aa844a1ada1904"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
