class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.17.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.17.0/claudish-darwin-arm64"
    sha256 "1262265c70f4f9f6a3855b98ef64dc86147b9be58cc382b9104d60e9c26aaf55"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.17.0/claudish-darwin-x64"
    sha256 "6d3e571302c5dd53bf4d29915609a2be7424af74bf933611844983c4aa371452"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
