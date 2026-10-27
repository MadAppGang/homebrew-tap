class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.6.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.6.0/claudish-darwin-arm64"
    sha256 "62f2e608c3ea54bd2310b16171143166c4bce71c629e0e3442daa792da8c7f4d"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.6.0/claudish-darwin-x64"
    sha256 "16026eab8a473b203933f579b0a63fe2a88253f44c61aa6dab39bf79c46b7220"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
