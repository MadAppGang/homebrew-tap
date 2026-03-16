class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "5.12.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v5.12.0/claudish-darwin-arm64"
    sha256 "28f7bc6b54b94a2672f889a94c3faeee1775e09d028fb836a16405785e513574"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v5.12.0/claudish-darwin-x64"
    sha256 "5b9b3d9529e7975cf9b0d1a82647c1c055e1808192ea6a57b3566b5bb4d8ff9c"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
