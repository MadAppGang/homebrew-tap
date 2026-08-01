class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.27.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.27.0/claudish-darwin-arm64"
    sha256 "ee25b9f0de2f008d9cca202b845f1deeba164ae0b237efb20253c066c9435814"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.27.0/claudish-darwin-x64"
    sha256 "4e3eb5d7819619658fb5ba61917c4ab82dc4de75319b127586b9131f16af6893"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
