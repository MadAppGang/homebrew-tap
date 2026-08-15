class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.50.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.50.0/claudish-darwin-arm64"
    sha256 "f3965bd0db0ffd90bf0a5f7874ed34beadc7e5f042903fc6568ee44fdce3c9fb"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.50.0/claudish-darwin-x64"
    sha256 "cdb668414be59fe64a828aa0de6ea3431bb259d5ba01b91ee24dbf4e394ad1e7"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
