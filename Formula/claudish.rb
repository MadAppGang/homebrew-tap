class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.12.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.12.1/claudish-darwin-arm64"
    sha256 "ba7520aafbb063bb64f87dbf184f342c0a17bdb0cc01c455a5227a08b911dce7"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.12.1/claudish-darwin-x64"
    sha256 "0f7528aae07b5e9a90a4f4058f692a5eee8b055d2f62401aa9575a0a1e9dc4ed"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
