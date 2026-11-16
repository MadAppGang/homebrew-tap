class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.27.3"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.27.3/claudish-darwin-arm64"
    sha256 "bfe234e2ab39a8d6cd1827d1bd3c564cd6f79e2be626915ac2d54d11c05acf32"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.27.3/claudish-darwin-x64"
    sha256 "1444d58246508bac63f7ae006b43816843820b9094cfac03ef6b0241e965c6f1"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
