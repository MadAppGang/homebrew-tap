class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.29.2"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.29.2/claudish-darwin-arm64"
    sha256 "c7d367841fd1f57f605ac2e20cbaf28dd068fec9115b237ff6ca0d96b4da79b5"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.29.2/claudish-darwin-x64"
    sha256 "881f4d415dd4a2dd6c62837c5c381638d78906595de4cec124e76af6451f75a4"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
