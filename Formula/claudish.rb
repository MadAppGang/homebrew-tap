class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "6.4.5"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.4.5/claudish-darwin-arm64"
    sha256 "f760c68269f266d02d4c3cc8ade4b66872dd0d6039ce9dddfc10806605740543"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.4.5/claudish-darwin-x64"
    sha256 "cc0a316575a940d39f651605929ae865783791d116cb8893861b242af9309cff"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
