class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.48.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.48.0/claudish-darwin-arm64"
    sha256 "06c4a68835a6bb1c08c84e1d22164a398dfd883c95e3458c09a0f1ee5abbc16e"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.48.0/claudish-darwin-x64"
    sha256 "fcc9532ddbf3133931859276087178eda491a86679ac971522ebcda21663357a"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
