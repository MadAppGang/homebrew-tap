class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "5.16.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v5.16.0/claudish-darwin-arm64"
    sha256 "4135179beb5396bd60d2e9a0f2295cab56ec22f555029689b35bca6e13611f1e"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v5.16.0/claudish-darwin-x64"
    sha256 "4db7adbeabc2886536850a7dabfc578d0f902fb76df6ee8ad57e9b0fef9c23f8"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
