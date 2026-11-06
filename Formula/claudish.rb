class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.15.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.15.1/claudish-darwin-arm64"
    sha256 "6d85d0fd56b95e945a20d6921d1ad2d8ca5e4e49b1ef1473dfc522d27da70133"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.15.1/claudish-darwin-x64"
    sha256 "530943190cb086d27baf5d74cfcf5fd9c5dd3fc7423f13304638e0c2eac31eb9"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
