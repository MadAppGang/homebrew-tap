class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.10.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.10.1/claudish-darwin-arm64"
    sha256 "93163caa35c247d2de06bef4ffecb5077abb674104f6946645e1de47b9e57d81"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.10.1/claudish-darwin-x64"
    sha256 "cc461a14aa6907122775d9c0c6bc71d8862f18b0b5bd363984a04c33469c7625"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
