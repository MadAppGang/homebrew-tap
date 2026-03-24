class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "6.2.2"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.2.2/claudish-darwin-arm64"
    sha256 "6b35e2b92fd596657b31cd73a33e3a47de3a003502ade6d884c48feb6223ad61"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.2.2/claudish-darwin-x64"
    sha256 "738e04da87652d3118cf66f866c8037a4ab23b426e880a37709016d73f06afe2"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
