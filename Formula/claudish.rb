class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "6.6.3"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.6.3/claudish-darwin-arm64"
    sha256 "8a55f0d558e4a55d7392cd2a9bfb2d40a0566af25f2e0f52898870486ee2e7f0"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.6.3/claudish-darwin-x64"
    sha256 "50925b22c341d6dea7d686c9848711488f8f7e928dde3185d2a86972f01556dc"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
