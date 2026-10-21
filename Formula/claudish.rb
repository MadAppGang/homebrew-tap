class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "13.0.2"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v13.0.2/claudish-darwin-arm64"
    sha256 "510240d381397b3d3329bb734632ebc424bb7c6753758239b910e4cb2b564170"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v13.0.2/claudish-darwin-x64"
    sha256 "1d1fd3a6bcccf71089d0956c97459be96577e55305eefaccba7ad69166de32d0"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
