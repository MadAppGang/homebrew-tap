class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.26.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.26.0/claudish-darwin-arm64"
    sha256 "b917111322519e331b19b98fc413838fa58883a5a698b240de725037f3f78f32"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.26.0/claudish-darwin-x64"
    sha256 "eee9951cd34df45c434953b2831dcf40076811cd72d931853544b10bf2627002"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
