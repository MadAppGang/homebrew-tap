class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.52.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.52.0/claudish-darwin-arm64"
    sha256 "67a5eb9137ed7f25b548f88c37cc6ba64b075e9fad67959e67b94499f7f07721"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.52.0/claudish-darwin-x64"
    sha256 "9f12abcc084d10f26e0641d01ead2b4581e1c51b84d7ee7227cf851aca21c89a"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
