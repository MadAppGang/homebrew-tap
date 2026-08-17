class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.51.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.51.0/claudish-darwin-arm64"
    sha256 "26e9faabd1284f1370eb389194fa80209475dfef407f526ba8b54b0cacceb26a"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.51.0/claudish-darwin-x64"
    sha256 "134c38cf600f35607188de22fe7c9a174068742e7ece8ec17ed22e931819880b"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
