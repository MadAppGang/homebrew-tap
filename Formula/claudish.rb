class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "5.19.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v5.19.0/claudish-darwin-arm64"
    sha256 "9ba224fbe9b4e22b968612dd142f44da5fdae7c14311409faea93db9840de789"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v5.19.0/claudish-darwin-x64"
    sha256 "116d1355da74b7b0da3eeef4f9d146bdd9aa48a73db33dd7a5712fa5d7648f48"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
