class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "5.14.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v5.14.0/claudish-darwin-arm64"
    sha256 "2ef42f22daccf62617098ba601244323bf7417d0f629d0cf2b2c2bd4ad128348"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v5.14.0/claudish-darwin-x64"
    sha256 "3580a3a8c8efd053bbbce9859f7d677dd08c14f5a333523947f1c028f498962b"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
