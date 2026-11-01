class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.10.2"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.10.2/claudish-darwin-arm64"
    sha256 "66ea90cdf807663fa05968223ab16d27513b87041d13dc3c85b040c008771161"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.10.2/claudish-darwin-x64"
    sha256 "c74842941c7d5c66c346bd5d3c7ef26b8109dcbb74b0f828e2ebb317dfb62285"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
