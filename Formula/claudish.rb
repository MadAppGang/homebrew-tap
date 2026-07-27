class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.19.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.19.1/claudish-darwin-arm64"
    sha256 "1ae9b343424b08cb526cf080432a47679c9eeccc8052fd4ea1759ea66e920c4c"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.19.1/claudish-darwin-x64"
    sha256 "340e28284f01efb009a47fbaf4c10ecbe537d2b9105c8b2256ce16969ef0890d"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
