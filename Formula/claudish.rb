class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.19.2"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.19.2/claudish-darwin-arm64"
    sha256 "812d0c3d269089f910b0c58923fcd067b0b74c3e0f9ec17836d2381593de2230"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.19.2/claudish-darwin-x64"
    sha256 "5c5aa275b76789e6b2a189cff96139f75c51a9e04a4ef1753ada725144afdb9d"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
