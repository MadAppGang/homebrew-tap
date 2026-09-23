class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "10.1.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v10.1.1/claudish-darwin-arm64"
    sha256 "51ab95dec521149808854e2754026e259dc28300ac14f1e5ef43cbfbdf722fa4"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v10.1.1/claudish-darwin-x64"
    sha256 "0d9f03249e72d87a5e87a6ae235d059b3e6002040091267ba1ef5128e5de20ea"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
