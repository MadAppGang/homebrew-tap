class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.22.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.22.1/claudish-darwin-arm64"
    sha256 "c0924709e12d690fb6d8cc08b20d0b9388904f1689a1c7d163e8c21ae6532273"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.22.1/claudish-darwin-x64"
    sha256 "a2a1a4b0680aac56974307cd189ec8da9e5fedc9b283e5e02c810a31840b17cf"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
