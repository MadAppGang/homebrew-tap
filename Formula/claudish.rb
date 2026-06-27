class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.8.2"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.8.2/claudish-darwin-arm64"
    sha256 "c225e46253363091d39ff7d2b194aa18c2dd12fd1f5ab5f60c5a94a04ea36e25"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.8.2/claudish-darwin-x64"
    sha256 "00bac0706af9a38d156d1f36438ab745de877d7f271b7633506b789afbbda460"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
