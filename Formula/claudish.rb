class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "9.3.2"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v9.3.2/claudish-darwin-arm64"
    sha256 "63b2baed61f0abd325eaa8ac3085d0ebdafd267d211876dddf2bfec8faa82509"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v9.3.2/claudish-darwin-x64"
    sha256 "3d12af098b6bccd87a5595b5d3e4dff7bed31bc8905cee4bafc440871166c1d8"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
