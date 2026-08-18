class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.59.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.59.0/claudish-darwin-arm64"
    sha256 "ee62a6bdb887bba6d55d1ce367bdd02b046e764ee4eade0aa6484820befc948a"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.59.0/claudish-darwin-x64"
    sha256 "4dd4acdf5c1978a7f3127d2a9b510f113475ca91f13ec8bfc6831af5be090c82"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
