class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "9.0.7"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v9.0.7/claudish-darwin-arm64"
    sha256 "6deff7aabe99d4fe55777b75ebc4faeb5a18119f13da16165d476869072f00cd"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v9.0.7/claudish-darwin-x64"
    sha256 "5905cb2cb8ffce8d051e33a1d97749077e1e66969ba5e1da94629ded4c67cb62"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
