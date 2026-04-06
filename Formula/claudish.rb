class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "6.6.2"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.6.2/claudish-darwin-arm64"
    sha256 "29245fffa297fdad7c6baa63dfc7bce596edee22041a7e7a10d8d58b7403a9d2"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.6.2/claudish-darwin-x64"
    sha256 "ba808eb9f2781895ff2ce455edec115103eef038d2d79300336773224e7a6571"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
