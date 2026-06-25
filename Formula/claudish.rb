class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.7.2"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.7.2/claudish-darwin-arm64"
    sha256 "4e547ca421396df19a709f86e6612140c77dc6f56150e177760290b0c4814d9c"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.7.2/claudish-darwin-x64"
    sha256 "425ad7f4ff07eff546cd0342f99ff2356b6d7c00ca061881e67f0e4acc7bb657"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
