class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.13.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.13.0/claudish-darwin-arm64"
    sha256 "c487fa84f3defc619221d5ab00cab5b52f94fef2079d2c69854b15f03112dca7"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.13.0/claudish-darwin-x64"
    sha256 "a36ed4ed9d19dfb5076a18ebfe1d3c5be8726ca47894e066ce851208906cbb5b"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
