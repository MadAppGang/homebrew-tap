class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.8.3"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.8.3/claudish-darwin-arm64"
    sha256 "5acb95ada1051bd6b0c135f9a134b50ccfb8b38e58065102eda48fc42b2dd0ec"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.8.3/claudish-darwin-x64"
    sha256 "3d6396bd116383448a065d270960265493702d97c1746644a364a196e788cd8f"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
