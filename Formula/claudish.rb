class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "12.3.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v12.3.1/claudish-darwin-arm64"
    sha256 "397c5a720768904b2653f8a923993586718cc21c06b8ef51ef9e60a5e74ba6a8"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v12.3.1/claudish-darwin-x64"
    sha256 "a7b1dc6026494b0286f07594b6f5057db8524a45600bc0651ca4e8cca983c736"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
