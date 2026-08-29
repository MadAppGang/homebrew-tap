class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "8.1.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v8.1.0/claudish-darwin-arm64"
    sha256 "ac507c8291b8cf20621b03769f792989eb157076cd037bf61c3ecb62ca01a8a5"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v8.1.0/claudish-darwin-x64"
    sha256 "3be5f45d46f2a21d48a2f1ccebdcb112b3ca4b71dbd5cf4b272b12411075e842"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
