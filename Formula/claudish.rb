class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "5.12.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v5.12.1/claudish-darwin-arm64"
    sha256 "dedf0a0924ce48b89ecdb515f2b29c2e55ea1c38793bc65c71708a36003f5539"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v5.12.1/claudish-darwin-x64"
    sha256 "33d056e99154840f1deebb83d2c787f6d317c16c4a972b1e045744d04306e983"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
