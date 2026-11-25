class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.29.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.29.0/claudish-darwin-arm64"
    sha256 "904e48ac47ac287a9d47c18d8f56270bd0830effb322e43986f3d992e6bc9f33"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.29.0/claudish-darwin-x64"
    sha256 "f48ff562167298d3e11938aeaeb984f7719cd6e2258129e3641fae20614f5c5b"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
