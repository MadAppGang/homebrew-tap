class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.17.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.17.1/claudish-darwin-arm64"
    sha256 "85726906471809b60f96a19f8cfe08cb83e774df04f1579db1d03ebf028fce48"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.17.1/claudish-darwin-x64"
    sha256 "0fdd998a853628ac04f2703556b23c0d80e7ed15b6f2d1d553253a44ebcba368"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
