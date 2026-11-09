class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.17.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.17.0/claudish-darwin-arm64"
    sha256 "485497dafedb9d8b520481cef377fb7145759f4f6c74264fd58ed4e7f39ee04f"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.17.0/claudish-darwin-x64"
    sha256 "b2f60ee14768f21bf511f714cd9c46bb200ec740b5075838acdf99c4e8873b22"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
