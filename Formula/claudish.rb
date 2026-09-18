class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "9.6.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v9.6.1/claudish-darwin-arm64"
    sha256 "86315a9ff31500f5a9c21eeafbc23da7ea061262cf7e1c46a6ea7d78fdc0cf8f"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v9.6.1/claudish-darwin-x64"
    sha256 "32b03d6a27875736d3e1fcc0f534d69aed4746b455a37fc3458fdb331f917caa"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
