class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "5.13.4"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v5.13.4/claudish-darwin-arm64"
    sha256 "9b3fade7192c5b6d3e1b90ffe52fe4cd0b4dc0784e735973d4730e471b1c9e93"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v5.13.4/claudish-darwin-x64"
    sha256 "da0b287d5e1f37c4869a4c077b84a12f807dbf4c51995390eac5859769789abb"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
