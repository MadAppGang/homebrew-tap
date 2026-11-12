class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.20.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.20.0/claudish-darwin-arm64"
    sha256 "41ab928ca8e76b831207237a33e1bef0199ea0f735a4d84494ef986b6ab8002e"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.20.0/claudish-darwin-x64"
    sha256 "74255b76d2305c6ea9cc2b68fe8dbcabadf68a9c1f1ff949ae992d6ba5113e31"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
