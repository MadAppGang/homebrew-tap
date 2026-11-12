class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.21.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.21.0/claudish-darwin-arm64"
    sha256 "22e1962a40857662355ee025a7642ccf4e21061434cd699e8c8acb02797edc4c"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.21.0/claudish-darwin-x64"
    sha256 "93d37bb98fd09e936a82617f326f8107b37154be4c8d001a0ec691f51a354da3"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
