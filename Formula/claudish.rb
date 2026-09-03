class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "9.0.3"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v9.0.3/claudish-darwin-arm64"
    sha256 "df3702d0b3f923e599260b0d3b9d78647406820f9b60ad315b0ae61b75112312"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v9.0.3/claudish-darwin-x64"
    sha256 "4fee32b8508d325a60a7fd1d2c63fa2d8384dd33f6ebb4b2c9e5ee64c35e4883"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
