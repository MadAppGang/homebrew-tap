class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "6.6.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.6.0/claudish-darwin-arm64"
    sha256 "d5b61baa8ed57c42bca936524d3ff458fba1b237861a2c85279f2fb9b07029d4"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.6.0/claudish-darwin-x64"
    sha256 "2abccab46b0ed03f8ba446576ce8afa019f2e53b9d0edb28066862a2e8fa4a20"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
