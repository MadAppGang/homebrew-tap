class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "6.4.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.4.0/claudish-darwin-arm64"
    sha256 "3aa2cca44f8d321c7c9815b60dbca665f7453f82e0d506a57ca978cfdd628238"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.4.0/claudish-darwin-x64"
    sha256 "c83df297c946c186d62760eb6c9f496647cb8e1290aacfeeee0811464e4e92bc"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
