class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "6.7.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.7.0/claudish-darwin-arm64"
    sha256 "a1f4e67a5b4d9732a5475d57b57f0f1f9603bb7ce24bcb15c0fbdc9aa579fe8d"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.7.0/claudish-darwin-x64"
    sha256 "32c3fbe6b86a22b4df91b0c61c0a0855a10e0e044413bcc2e15082ff49c94c2d"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
