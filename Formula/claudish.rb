class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "5.18.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v5.18.0/claudish-darwin-arm64"
    sha256 "6e0fac30009ae22bc686ca3fb2c754d7d528cd1c3bf31d43d90870ab90a61cc9"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v5.18.0/claudish-darwin-x64"
    sha256 "7b31d8f8b35b685dacd390bc1a56d87390223d949330537a273e87d799f1a6ed"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
