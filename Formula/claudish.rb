class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "8.0.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v8.0.0/claudish-darwin-arm64"
    sha256 "329b01862e3977bf1f667c29c0eef529dc860228a406bce372bd0c36b2998013"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v8.0.0/claudish-darwin-x64"
    sha256 "729f5b9251e63306575257edac0b8d6b3dedf9aaed99d23571e8ac040ae71242"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
