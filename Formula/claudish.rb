class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.18.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.18.0/claudish-darwin-arm64"
    sha256 "e4ce80b2306daa9075d0dfdda75134dc3490b40dedf32bd12797a6ad81c58c4b"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.18.0/claudish-darwin-x64"
    sha256 "32cf016f9b9df015884819437ea2c6547c04e5bbef3e4cf555f2d06af30dbad4"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
