class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "10.7.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v10.7.1/claudish-darwin-arm64"
    sha256 "f27b93f23d8ea068ecc93209b74ce9670fd4ab422570567b44e08467bdb773c3"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v10.7.1/claudish-darwin-x64"
    sha256 "7324cf91514eb167995e17e619f559ba8795d15bba6a8a1966a70f04c609fbb5"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
