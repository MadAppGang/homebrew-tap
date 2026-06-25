class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.7.3"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.7.3/claudish-darwin-arm64"
    sha256 "6c9a24d8e5721b39a104cd433452cdbd1769937679b5327012db018b571bcad0"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.7.3/claudish-darwin-x64"
    sha256 "c708db2c0160622b18a39485da6c5631d7836c3c41914cdcc4e0ed25f495772a"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
