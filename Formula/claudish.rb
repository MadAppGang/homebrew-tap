class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.12.5"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.12.5/claudish-darwin-arm64"
    sha256 "5d78696230355218ac530e1ed344353ea74763e6e665b5709c77c485f14ed10e"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.12.5/claudish-darwin-x64"
    sha256 "b7f1890975ac7888368340d122cb28a905fc1321f210988fdbd004d9a27b4cd1"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
