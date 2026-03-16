class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "5.12.2"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v5.12.2/claudish-darwin-arm64"
    sha256 "bb7535247ca8c4daa6196019b5517fdb4fb60fc6e0ab6e1f532721ff43f6d6c3"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v5.12.2/claudish-darwin-x64"
    sha256 "4894c7dcc35ac6bf44bb9b09bdb53e67332720797125e388373e0c83834f7bcd"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
