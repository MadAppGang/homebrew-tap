class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.1.2"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.1.2/claudish-darwin-arm64"
    sha256 "4574804ace85def094099a26accf052830d901f1d373e2e7329b078b855c17a9"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.1.2/claudish-darwin-x64"
    sha256 "c976f9f81145ea1c8fd7718fd2a1740125697141a591aab2a4c3f232947ad9fd"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
