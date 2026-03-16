class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "5.12.3"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v5.12.3/claudish-darwin-arm64"
    sha256 "da90cc5add22d25aa213a652c08df886e24ecb854452c9a1d7a3d31e6df200f5"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v5.12.3/claudish-darwin-x64"
    sha256 "36b628930dc7d6eb68c87b383372e3e7f7a790c5adc397aa2cd741bd9f47d396"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
