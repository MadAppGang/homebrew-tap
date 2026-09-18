class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "9.7.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v9.7.0/claudish-darwin-arm64"
    sha256 "5a0a94d3f31b46bbdbbfbb821b7828ebb64433ec4580c07e421e77c24462b1d5"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v9.7.0/claudish-darwin-x64"
    sha256 "d8af7912b6c17fd397ca730fd59185305edac97ecd2e72184505f94d3aeff354"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
