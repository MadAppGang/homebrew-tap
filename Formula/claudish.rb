class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.15.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.15.0/claudish-darwin-arm64"
    sha256 "eecb142f2c45f4e6ee257d27e6fb040d38a15b89a0a48501856266cbb5a20f0e"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.15.0/claudish-darwin-x64"
    sha256 "536942d3645d16ec005e60059a5a53742043c71afae19fc7efc183ae413027f0"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
