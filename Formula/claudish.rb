class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.13.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.13.0/claudish-darwin-arm64"
    sha256 "da611841bf8b45648990b7d46604feef0310dab8a1a14a8fe4bb07695d931d9b"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.13.0/claudish-darwin-x64"
    sha256 "0243c5b108c306e23aebd81010e451d066ebe1824eda0cd012f3d459cc76cf93"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
