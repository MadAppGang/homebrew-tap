class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "10.3.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v10.3.0/claudish-darwin-arm64"
    sha256 "4f1d5f5e609bdd0acdba62c0da838ecaf523f6514fe5a6b949ebe412570c81de"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v10.3.0/claudish-darwin-x64"
    sha256 "f6e8b9299a0067cdfd3d17465cdf31c7339417e968f9aa990eea56967b187662"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
