class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.5.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.5.1/claudish-darwin-arm64"
    sha256 "6a8e9d8938d9814c6a4bcfcfad7dcb09b2f218a58f75aa1454d061f37cf484d4"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.5.1/claudish-darwin-x64"
    sha256 "0f51b83ee514fb0db62f8061238f728f7c7ec4cc31ca00bc7811aa9677936abf"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
