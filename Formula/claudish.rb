class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "9.3.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v9.3.1/claudish-darwin-arm64"
    sha256 "a71195118905efde236d1bc9adea40784274307a66d7ce9be2ab93641eb78980"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v9.3.1/claudish-darwin-x64"
    sha256 "7b3e0799e32e60f54f09cda8d8fc0ac5bb99a3e3b0301f5b7ee2a3efc1138b8e"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
