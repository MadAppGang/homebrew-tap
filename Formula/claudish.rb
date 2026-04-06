class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "6.8.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.8.1/claudish-darwin-arm64"
    sha256 "8a1e1e59f5ac8dba4fb14d53e6d5afcd1893ccd16adf019508135f4a8c303956"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.8.1/claudish-darwin-x64"
    sha256 "9420d1885ad4571a1f0b3e43a413b4eb3d4d08f6b6f8559c8884c1737132988f"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
