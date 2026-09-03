class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "9.0.4"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v9.0.4/claudish-darwin-arm64"
    sha256 "f0b01003d7415d6264ef0fec39fd0b672be24a58ae8909144b97cc026c8ed2d7"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v9.0.4/claudish-darwin-x64"
    sha256 "666f7cd80d469d57df1fb9ffc785fd6c73a75ec475327cda959cd75e416ab54d"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
