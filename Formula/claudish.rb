class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.26.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.26.1/claudish-darwin-arm64"
    sha256 "2267add3066fddb3cfca4228b4fae260f0aadc3080fe8805070b46c5dfe14147"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.26.1/claudish-darwin-x64"
    sha256 "18b350c336adff32bbd4530c20baebc83acf2dba5b009567a5fc7a7afb4856e7"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
