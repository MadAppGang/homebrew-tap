class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "6.12.2"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.12.2/claudish-darwin-arm64"
    sha256 "07da5ec02457a59fbb212d115bdc9631cf3d6bd83d94c65ee33cd09e03a70b2e"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.12.2/claudish-darwin-x64"
    sha256 "c8d96775abf1d1eeb8cecbe4f5204ed850e6efb6ce394acfb2dd6fe3cee0c054"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
