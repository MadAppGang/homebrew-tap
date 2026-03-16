class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "5.13.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v5.13.1/claudish-darwin-arm64"
    sha256 "c6c2c8ddf491177191ccabc28cbeb8ae65d20d7a5f396005c87de03edd50d7b3"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v5.13.1/claudish-darwin-x64"
    sha256 "24bd6f3cfe7e8e33381cb9a927211f447ec1c27c7bdc163502225869a6a54e63"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
