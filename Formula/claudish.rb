class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "6.12.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.12.1/claudish-darwin-arm64"
    sha256 "6384dd36368678a9057d624cadeaa1a25a11c4784fbe6a73f947a3ee8cee56f0"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.12.1/claudish-darwin-x64"
    sha256 "14aac8b74efbbed0f7fe544951f73045abfee97338d362ab0960179765175765"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
