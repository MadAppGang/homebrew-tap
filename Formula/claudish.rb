class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "9.7.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v9.7.1/claudish-darwin-arm64"
    sha256 "92800e729f44a7884d44e8f14042527ac4b1eec6c788daea14d8d43a60ae630c"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v9.7.1/claudish-darwin-x64"
    sha256 "58459bdc2e753e0633f2b68d75b4989d6073ca75c085cb4dc83db2a1bccc26fe"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
