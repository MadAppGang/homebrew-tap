class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.12.4"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.12.4/claudish-darwin-arm64"
    sha256 "aba619bd633400eae6de18cde3e85f1e8588ef3b748e14127c0b92d5895a23bb"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.12.4/claudish-darwin-x64"
    sha256 "6e031747f5ca3beb00fc60843f49110af5ad5cb52884e6efa9e28b9de00560bf"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
