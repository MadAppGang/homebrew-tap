class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.39.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.39.0/claudish-darwin-arm64"
    sha256 "39eba1f3d3e0ff215ea86a2fd9c1978510f4b55bc41fce1897af47d63b793aca"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.39.0/claudish-darwin-x64"
    sha256 "2a79deeb61298c85e0a925e11afc5a5ce947eb1ed8107e21a45417eb4ee01201"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
