class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.20.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.20.1/claudish-darwin-arm64"
    sha256 "36a01e96e032e87557da3a6fa776c3e36416e9f60bb22a7d413a0600970fe589"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.20.1/claudish-darwin-x64"
    sha256 "3de1d3526921311e3d402b67c455dde1d1756933433e5ddef986b1baa31eee57"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
