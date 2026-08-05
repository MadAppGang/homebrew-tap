class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.36.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.36.0/claudish-darwin-arm64"
    sha256 "65980fce76c2d292c959082049719db4ff976ec250980a7718e47f323f8c9a4a"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.36.0/claudish-darwin-x64"
    sha256 "cdb06f42c3fa4798553d621172906bf30339fc7b75a1f7c2658cdc390d5740bf"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
