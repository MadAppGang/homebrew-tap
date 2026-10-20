class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "13.0.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v13.0.0/claudish-darwin-arm64"
    sha256 "a65217bd87681a6aa023728f1a64d6d726fbaf4bf4f082395ad2b652be836de6"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v13.0.0/claudish-darwin-x64"
    sha256 "837f2a369e8349f98ee7f8d8ccda01243326d13ef2e0302df03f541e5527f670"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
