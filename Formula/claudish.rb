class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "6.11.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.11.0/claudish-darwin-arm64"
    sha256 "dd2651018e0068b97dc8de8b1789eba095b15d8daf9dd4fc52c3878de2b42c07"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.11.0/claudish-darwin-x64"
    sha256 "d124e78a3e5ccb2b725951f28e2da3a2d3b3772616370acfd8957b0848b20ef0"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
