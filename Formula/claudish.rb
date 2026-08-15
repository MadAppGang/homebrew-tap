class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.49.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.49.0/claudish-darwin-arm64"
    sha256 "7746d96d5e2dac5afb5e26b81693d27d347c3605f305ce7515f3b855183f5132"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.49.0/claudish-darwin-x64"
    sha256 "3fa388962e191eda5d406c5ba9ccbbac2aadf0995ebcf3797f82502ff656d1bd"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
