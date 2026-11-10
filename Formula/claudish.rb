class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.18.5"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.18.5/claudish-darwin-arm64"
    sha256 "1e8462e9497cdc7255b33e6c33f939f3f99126bef8acdfc1d4d1f8007700f36d"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.18.5/claudish-darwin-x64"
    sha256 "7701f1b52ab6d553444bd151c35918cecdb88680ea20b59463dcae6b9486093b"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
