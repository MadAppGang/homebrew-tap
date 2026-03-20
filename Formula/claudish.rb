class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "5.16.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v5.16.1/claudish-darwin-arm64"
    sha256 "83f421f4bc73de8c5fe48344589274d6c6103f7052f9ab59d992a695bdab5135"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v5.16.1/claudish-darwin-x64"
    sha256 "d5f00ba3d6bda593a486a1a66a5e32f4bfde508e4584350ecbf68b07f02fb339"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
