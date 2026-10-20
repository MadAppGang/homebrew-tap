class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "12.2.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v12.2.1/claudish-darwin-arm64"
    sha256 "e117a25b07b68c15741b1eea031a2492dae7670223e86ce47283434708e52d93"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v12.2.1/claudish-darwin-x64"
    sha256 "8b75e65cd46932c4603a246d63a43ecb06de92f367c729deb97ba2282aeeb119"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
