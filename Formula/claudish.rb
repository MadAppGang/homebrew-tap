class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.28.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.28.1/claudish-darwin-arm64"
    sha256 "df84de755f1fcfce63b901950fc72a3f17662730d81b698b20e1563e74d5b97c"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.28.1/claudish-darwin-x64"
    sha256 "1ac1da1407954cbcd9f58cd0e107f20509ddf8ad95b6d65830a1b20da63ffb58"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
