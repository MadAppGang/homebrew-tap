class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "12.2.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v12.2.0/claudish-darwin-arm64"
    sha256 "6343b3dbf77799e54d495600fc0ce72fd8cdef0acef24e62ad0415b1d871f31d"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v12.2.0/claudish-darwin-x64"
    sha256 "8a015fc2e0da629bdf79839a5ddb4a649d22b0d320125d32f9014d0d358b0e45"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
