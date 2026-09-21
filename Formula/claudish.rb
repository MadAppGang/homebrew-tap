class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "10.0.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v10.0.1/claudish-darwin-arm64"
    sha256 "e71386bb5ba80dcbf25ee11a1fe0531e18d252d204b176714290843c6270d001"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v10.0.1/claudish-darwin-x64"
    sha256 "25123c42b43c1eb4d854bd599db2dda02324806b499ea4124f4a291fab2da4f6"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
