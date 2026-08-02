class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.28.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.28.0/claudish-darwin-arm64"
    sha256 "ca7acf0054662bd41f3086d3733dc146daa5060acb2331a1cf53cfb14c202072"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.28.0/claudish-darwin-x64"
    sha256 "e1bf72f056db9e4ce6373bdb2b8ab0645257b476300eaff5cf76b59581fff6a9"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
