class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "10.4.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v10.4.0/claudish-darwin-arm64"
    sha256 "b42c27727398f46ba00e222ee09e88ab2357430a753c0455496f53dbf08bb166"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v10.4.0/claudish-darwin-x64"
    sha256 "bb544d32edca0de54cd504e518cef643298b96e76b640c48092f1bea9d9a6961"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
