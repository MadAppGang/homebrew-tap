class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.8.4"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.8.4/claudish-darwin-arm64"
    sha256 "c9d7514c36ac7b311291a01fe72e2eaa7580525b6b79e86d6a452287bc8783e6"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.8.4/claudish-darwin-x64"
    sha256 "c8a3c19e85caef716e37e96b6b4e819b45d9a48f4c2ac63c0f1ba3b3d9050133"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
