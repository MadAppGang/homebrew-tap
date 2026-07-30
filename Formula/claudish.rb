class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.24.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.24.0/claudish-darwin-arm64"
    sha256 "594e50bc763a72326808cc9f387eb4f55b65a2b9120d289b464c0be068866221"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.24.0/claudish-darwin-x64"
    sha256 "d9f327c0f832ce45f7adb8486afca819698c01023c707070a6fff8748f71c8b8"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
