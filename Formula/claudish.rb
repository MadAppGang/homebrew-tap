class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.3.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.3.0/claudish-darwin-arm64"
    sha256 "e5bd5e7b3cf9041bcbb96b383ee8a1c05e0fe4c6c13e59f1545fb157543f8748"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.3.0/claudish-darwin-x64"
    sha256 "74574e830bd997b53d734b44925d21b67cbf306760f32dfd471edf2b5c1bb2d1"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
