class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.65.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.65.0/claudish-darwin-arm64"
    sha256 "0312e79f020e70cf0610f07bcbf72e74de08849e920a7974a156117141ed163c"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.65.0/claudish-darwin-x64"
    sha256 "5169bf13f32a690d989cbbedcf2065a4178974e2e1ddea0b3927cfdf891fd6f5"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
