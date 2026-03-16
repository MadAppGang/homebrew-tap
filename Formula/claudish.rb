class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "5.13.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v5.13.0/claudish-darwin-arm64"
    sha256 "8dd2a4a5d781f0214bcf1529e5407c064490821172a775d812cb876225bb4aa9"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v5.13.0/claudish-darwin-x64"
    sha256 "88c99b0d07f819873581328e84f4e71c8544af5a0779545294db2641c18531f3"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
