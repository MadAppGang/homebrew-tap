class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.22.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.22.0/claudish-darwin-arm64"
    sha256 "7b291df3a9433a881fdab0df15a946a3591c256acadb3878c6f6cd3c70a308e4"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.22.0/claudish-darwin-x64"
    sha256 "9bab208f2db5a4a591eb5dc8c968a83bf33fd1bc32ee56045f1fc274a4c51cd6"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
