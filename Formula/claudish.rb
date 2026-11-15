class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.26.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.26.0/claudish-darwin-arm64"
    sha256 "9c9953ea50cc897f35af84ca178e5bc6af0f76c56f347862df186c0874b027df"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.26.0/claudish-darwin-x64"
    sha256 "6df7931a381ce62354ba0fb4588dfbf5f90c55c8dbbee46e7ec3a76919b23a93"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
