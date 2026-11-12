class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.20.2"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.20.2/claudish-darwin-arm64"
    sha256 "7210c8d21c48d55a8301404b0250ad58a9866b1cafcffc76eb031382bed6cf11"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.20.2/claudish-darwin-x64"
    sha256 "4c831f30f84bb657bab1846c17936b882786ef5e1294ba74649d875217b5587c"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
