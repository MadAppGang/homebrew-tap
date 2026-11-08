class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.16.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.16.1/claudish-darwin-arm64"
    sha256 "85c74e17413cfc1fde34fa36f8729d52e3f69e55281edc893158d0507fcc5391"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.16.1/claudish-darwin-x64"
    sha256 "3d51352ba7355770ce851f388f8b1bdf8c7b605c7aeb21d9fb2c42587bade5f6"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
