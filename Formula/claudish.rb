class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.7.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.7.1/claudish-darwin-arm64"
    sha256 "9e3216464c2e5d1ef69f25e9df4023d73556c603588a2feabd0ce984551edc9c"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.7.1/claudish-darwin-x64"
    sha256 "381a155ff2eed61d1bc80152b11c7223b60a4d5515eed69bd0c135da186a5828"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
