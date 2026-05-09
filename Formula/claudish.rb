class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.1.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.1.1/claudish-darwin-arm64"
    sha256 "937f6f924db37a53a2de7cce22011537ae30a00f1ac3592cc82af363cc603add"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.1.1/claudish-darwin-x64"
    sha256 "b866c1b9fb598a40684e1cfda764605fa775aa0112e376c47df2cb167933aa9d"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
