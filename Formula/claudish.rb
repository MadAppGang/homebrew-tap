class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "5.13.3"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v5.13.3/claudish-darwin-arm64"
    sha256 "b5c86bd107483fdc2a7f510f2e24565da3b2a15882373c48c748e6a0d0e97a5c"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v5.13.3/claudish-darwin-x64"
    sha256 "27cf6564bbe94862d6d784d358a814884777703848639ced3ae7716f6254cdbd"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
