class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.53.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.53.0/claudish-darwin-arm64"
    sha256 "2c9eda465dee3e903cb126557a6ddab0d5c4774701a62e86e9822090e2e602f0"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.53.0/claudish-darwin-x64"
    sha256 "c95e0d11597d1482f863795fdd667f0f6e0da9eecbff3dc6225bf11b57b82231"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
