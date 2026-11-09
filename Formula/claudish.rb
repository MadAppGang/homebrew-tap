class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.16.2"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.16.2/claudish-darwin-arm64"
    sha256 "d042e0dc85c1e5c8f056faa53f16e6426414755dfc884c05f1253d2f470409b9"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.16.2/claudish-darwin-x64"
    sha256 "b8bc0f9200797680f47f03d48d1547e4c1eb97241e85d3dba6a843581338cf19"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
