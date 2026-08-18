class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.61.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.61.0/claudish-darwin-arm64"
    sha256 "523252f2ff420636ff63e9d700637f0569a6febb9cb0518b63ddb63230274d36"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.61.0/claudish-darwin-x64"
    sha256 "8486e0921220d9fbe474c4457946e6b3a3d36532bf4cc3ce2ac25d0898c9e702"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
