class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.12.6"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.12.6/claudish-darwin-arm64"
    sha256 "1f916ffeacee2e2500beac9f732ac31800db4159f5753b4ad26c9b6790b974d2"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.12.6/claudish-darwin-x64"
    sha256 "b4ed4f2d4c0a060f4c23dbc380a8c17a3bf5abb662c6632e23c7f4f32886d018"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
