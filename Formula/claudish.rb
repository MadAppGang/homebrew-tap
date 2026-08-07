class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.44.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.44.0/claudish-darwin-arm64"
    sha256 "1d94eb42f88ce0dc1b7f3b31604e1a3c609d31fd6c3f5cb8e699a7564564970f"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.44.0/claudish-darwin-x64"
    sha256 "5b31c23376968b86c53c0d5bb748775953e9ccd01c17112c04e82e87af58a620"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
