class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "11.1.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v11.1.0/claudish-darwin-arm64"
    sha256 "3b17f1ab79dd8277987ddb3712a1ddc0d522b589f0c04c908b9d87e9cdb8df78"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v11.1.0/claudish-darwin-x64"
    sha256 "7e1482ecb2ab57df13a8355da7ab76ba2b186a7eb93ada991b0189538dee8238"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
