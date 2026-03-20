class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "5.16.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v5.16.0/claudish-darwin-arm64"
    sha256 "d6815ee7939741a9c35a34be6846094d1ade3564121e31df39d204676df5f35c"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v5.16.0/claudish-darwin-x64"
    sha256 "8fd40cfa36d3d09e929b4a6d015f34853b57ada4ac4f656f909881884c4f4cd6"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
