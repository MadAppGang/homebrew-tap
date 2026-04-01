class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "6.6.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.6.0/claudish-darwin-arm64"
    sha256 "d1e09c571a8cb7c17468e6528a0687e4b93d676acd957f6f6f4d378636193e2f"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.6.0/claudish-darwin-x64"
    sha256 "1a2fc3268d4ebc1184fe885962d71171cdfa6b7b2bcfa478975f59d743639b48"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
