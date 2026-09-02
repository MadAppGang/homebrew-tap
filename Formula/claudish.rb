class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "9.0.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v9.0.0/claudish-darwin-arm64"
    sha256 "5d2cd4fa7ebf6e356018b5534ea963b9e26de8558153926a237bd1f2d69db35e"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v9.0.0/claudish-darwin-x64"
    sha256 "7b10c3d2e432e16df8e72cda79dc1777fc2dc5dab47aafac78c72f22a9d3c863"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
