class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.1.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.1.0/claudish-darwin-arm64"
    sha256 "beae4008e39f181d4a60aa1ac29dd5fec219c3fb593e7e91b35a96f43fbdcceb"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.1.0/claudish-darwin-x64"
    sha256 "abcffcb1ec853145287193f722894c068742b1aafc987f195f786e1da3b9cd6d"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
