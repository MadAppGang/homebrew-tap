class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.18.4"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.18.4/claudish-darwin-arm64"
    sha256 "04ca9dd1f54987d6199c23e001562376521b455c1ebc5aecfb11aaf8cd1c5b8a"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.18.4/claudish-darwin-x64"
    sha256 "c3fb9cdd8cefc8d8155db5b67d959c5cbc6bfbbfcbbbe8cb71ad2cbfae7bed28"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
