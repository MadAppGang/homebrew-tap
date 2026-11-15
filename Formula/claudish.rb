class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.25.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.25.0/claudish-darwin-arm64"
    sha256 "ad347d9fd677be87e6239d98e94a47c19f55ca8c013e06e299f40667e119dab0"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.25.0/claudish-darwin-x64"
    sha256 "463eff355c8f9b88f88c26ba3d6e9518a7fa550cd8889914a742273526d85c18"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
