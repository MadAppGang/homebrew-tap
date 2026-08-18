class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.55.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.55.0/claudish-darwin-arm64"
    sha256 "d6f6089d22ca80464fc1cc158dee421c4392128ed2bcd63711c358329f1af91a"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.55.0/claudish-darwin-x64"
    sha256 "461fc630499fded35ab79a1839f582e09b321bbca056bf424bf068dab415d317"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
