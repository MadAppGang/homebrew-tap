class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "10.6.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v10.6.1/claudish-darwin-arm64"
    sha256 "30d40a11c99c4b88d8798f9602ee9297357fd18df2a6faf503375da6b0a26063"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v10.6.1/claudish-darwin-x64"
    sha256 "66de76424d4b13f6773455ccad94a0ddc66ace1a7d093ed2beb6f142ffa3b413"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
