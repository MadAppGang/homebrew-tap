class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "6.12.3"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.12.3/claudish-darwin-arm64"
    sha256 "8c1e55a6f0a626f1bc37c61ee133c614da85ef54733802340bfd418f0e75e2da"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.12.3/claudish-darwin-x64"
    sha256 "09be4ae2b91a908cfa367f7fc116f47ce0e16122008a27ce993adeba7d5322b2"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
