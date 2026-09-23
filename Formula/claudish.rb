class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "10.1.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v10.1.0/claudish-darwin-arm64"
    sha256 "6b4ea2ab2ed2b538d27b1a49e46c63112861f9a2effdf2d5f1c68a041c14d2b3"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v10.1.0/claudish-darwin-x64"
    sha256 "fb9bbe34da1db238d34c1a0b120a502a690589f0d55cc5d1e555ec09261d66fd"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
