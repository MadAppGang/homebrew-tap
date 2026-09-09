class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "9.0.8"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v9.0.8/claudish-darwin-arm64"
    sha256 "f5591ec00a1f895babbd2481ecc1fbea2ce31c6b79aeff357829bb24dbaabbaa"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v9.0.8/claudish-darwin-x64"
    sha256 "2eb9e263b4aa04261479ad206208eb9ce7ae185f4bbdb65230becc32b855977e"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
