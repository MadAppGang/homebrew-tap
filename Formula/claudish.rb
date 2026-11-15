class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.25.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.25.1/claudish-darwin-arm64"
    sha256 "e27487d411cdd81b0975cf6b4cd753abf37200b875010ea4e61ce3b61883e2f7"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.25.1/claudish-darwin-x64"
    sha256 "4c7ecd17791054a7e518cf935eca3286a311ea7f3f512b1df2f41c6d7898b90f"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
