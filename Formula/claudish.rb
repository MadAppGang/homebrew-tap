class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.5.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.5.0/claudish-darwin-arm64"
    sha256 "b3eb6256ae7e9eb627b9915aa44ec4c103aba2d0b37837da8f038b76f383ba1a"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.5.0/claudish-darwin-x64"
    sha256 "03f2f5b72dd6a1d7546db06a6a3af969b777fcda6805d05f2fd435581521bba5"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
