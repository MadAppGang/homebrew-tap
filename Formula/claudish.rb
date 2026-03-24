class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "6.2.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.2.1/claudish-darwin-arm64"
    sha256 "3488483b52d4604cce187421d0878adbc4e8b20c6eb6e69de5ba497a78242cd5"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.2.1/claudish-darwin-x64"
    sha256 "7a68afd06c2ab1408579be3ab61aac1118926eb82213015d5b51256f82f5de84"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
