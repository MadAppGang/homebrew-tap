class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.8.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.8.1/claudish-darwin-arm64"
    sha256 "7ac5fe9d2426ac6cba6402a48d98e3df2130b44b19863658fce62a709d093b20"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.8.1/claudish-darwin-x64"
    sha256 "6f05b6cbb74ae7ac225c20da9e4d51bb4eee81105e74282c201fb7d3484974d2"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
