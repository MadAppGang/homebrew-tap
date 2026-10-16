class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "10.6.3"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v10.6.3/claudish-darwin-arm64"
    sha256 "10609492b01312b533f0746287d329a4f9f079a22554524d6b23bed59637f6a6"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v10.6.3/claudish-darwin-x64"
    sha256 "76cb7a2bf7240beae9c70d589e59d09614e24b9f4f532fe849c7d3532cbfb077"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
