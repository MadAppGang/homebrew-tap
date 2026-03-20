class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "5.17.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v5.17.0/claudish-darwin-arm64"
    sha256 "be96d01d0e1a788b2acc6d70cbfcb2aadaa47a741e031ecf0e8329a008aba242"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v5.17.0/claudish-darwin-x64"
    sha256 "71499857c9c786b193b51a0e174814dab986e581e9299100fac122497bfb8d1f"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
