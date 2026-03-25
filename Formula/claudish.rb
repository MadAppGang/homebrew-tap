class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "6.3.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.3.0/claudish-darwin-arm64"
    sha256 "3d5ccdde593ae92cf218c252688de56689438164a578102a7d7b1311b0762bab"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.3.0/claudish-darwin-x64"
    sha256 "23d6a7d7567590a6431c46d4410321efb33816dce6e44a25818abe2c08c58c74"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
