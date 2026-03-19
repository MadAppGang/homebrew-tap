class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "5.15.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v5.15.0/claudish-darwin-arm64"
    sha256 "c6097260cca64c4a33d68d8a9246ac67c43a35b7ce9de8688f4ab886eca8e94c"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v5.15.0/claudish-darwin-x64"
    sha256 "1af28e2b6f96bbbc36a400a43f806d57ae385f2c84377ff8d6077c1f707cbd05"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
