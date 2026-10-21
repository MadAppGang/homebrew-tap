class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.0.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.0.0/claudish-darwin-arm64"
    sha256 "d6f55ce0085ed8608338d1dadc4ade30031195842a83a5b5f95bfacfc51ad4d2"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.0.0/claudish-darwin-x64"
    sha256 "81617b6b3ada95b95b75f63073dfde6fb554ff44e18d9120680057927eb5bf43"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
