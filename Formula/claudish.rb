class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.66.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.66.1/claudish-darwin-arm64"
    sha256 "761d5c8bf0ac935b9161399238c6eaaeee8589d7952ba6ad2383920c3d76e03d"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.66.1/claudish-darwin-x64"
    sha256 "40d16c74e36ebf72d9139dd7db2da8bc2ba5686c8050f29a2f3a29fb399f0c53"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
