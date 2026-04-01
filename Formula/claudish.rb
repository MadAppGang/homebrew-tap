class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "6.5.3"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.5.3/claudish-darwin-arm64"
    sha256 "0b60eec6453072d7012e68f856d45d6769c342d1180544778eb904cc2b7aa5d5"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.5.3/claudish-darwin-x64"
    sha256 "ab310d6650b9619031b419c2baed26718cbe8ced509bc136f5c7edc5aec1ccdf"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
