class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "9.5.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v9.5.0/claudish-darwin-arm64"
    sha256 "163cb1866569b224ce4b08a44f17518ffda29981a9d762a793c2e3be057b8a65"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v9.5.0/claudish-darwin-x64"
    sha256 "d0db55028de0cfed42d866ffb0a2af1d9a81e072da9b42421aaab3d0187265cc"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
