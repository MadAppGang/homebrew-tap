class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.20.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.20.1/claudish-darwin-arm64"
    sha256 "646a8b3ce44bad198dd660d63aecf945d00c1ea7b3b494eb4485fd227d15232c"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.20.1/claudish-darwin-x64"
    sha256 "0e0918f1f96e8f1fc8f5b005120c53bf1d5d829a05ef5f33880e630e625a24c7"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
