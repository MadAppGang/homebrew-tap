class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "6.5.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.5.0/claudish-darwin-arm64"
    sha256 "71b40d27664dca1fc3fb8092fece917ed644a05bf431d6d8b34f27ddd3d7da4b"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.5.0/claudish-darwin-x64"
    sha256 "9b45f0fc85262f6db68f8c1813845284af963d615b3d7146092ee33d602a7f81"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
