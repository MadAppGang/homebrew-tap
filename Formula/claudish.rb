class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.4.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.4.1/claudish-darwin-arm64"
    sha256 "a078fea24e731fd005ece1c6523f29be94a5d3675395a29a7cc395e23fd112fe"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.4.1/claudish-darwin-x64"
    sha256 "0435ee17f3bc59e4a43a3fc568d345afc864f529a5cdb12893875adf0a3b41b1"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
