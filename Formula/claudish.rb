class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.8.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.8.0/claudish-darwin-arm64"
    sha256 "94414abdf26ed15056b090e7401bdbfc55ed5e040c02de4765d2fe02e58a0705"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.8.0/claudish-darwin-x64"
    sha256 "e469ef0debd8d7d838689b0047c329b156da169e4e0bb5f6133d4d65737eb987"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
