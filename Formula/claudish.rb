class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "6.8.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.8.0/claudish-darwin-arm64"
    sha256 "ab2538ae265ddb2453480d87c4d539c7871501cf86ced4d313ba65a0c737d0b3"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.8.0/claudish-darwin-x64"
    sha256 "0fe9ea0087f39aa697e8b4e022964eb0a7f969d2b7e866eae9c91cb0f214934e"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
