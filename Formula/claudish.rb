class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.37.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.37.0/claudish-darwin-arm64"
    sha256 "a0e069ae4d8ee400f766d8a5ce283d7898ef57f9ed4ef454d3ad7fb4c625cece"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.37.0/claudish-darwin-x64"
    sha256 "b2067a13eb21392d7b59f1c238993578c2c02b591d7fe73860315d45097f7850"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
