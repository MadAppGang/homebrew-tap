class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.27.2"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.27.2/claudish-darwin-arm64"
    sha256 "65c257e93a933601645d04bc56488b2f04b6d2178693f3e378656427f8ae0be6"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.27.2/claudish-darwin-x64"
    sha256 "e1c8440917a9d66ae6c69965e4566397a24232723b357e6853ed1cb9a59063b5"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
