class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.18.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.18.1/claudish-darwin-arm64"
    sha256 "5aa75d21f20ea6633899af49e1e11ce80c2e3a37f05ced37cc6f783342eaf117"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.18.1/claudish-darwin-x64"
    sha256 "bb29ff7293c0429655399230860b52310ed8e60cf0c194831c61fb74978b3c99"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
