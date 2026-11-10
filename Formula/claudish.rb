class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.19.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.19.1/claudish-darwin-arm64"
    sha256 "37442a8467253f1c30eef101474415080bd1524137ff604100f2e75626bf230e"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.19.1/claudish-darwin-x64"
    sha256 "b0dc7bf1097529d1367fedb3bb586719caa48334f908e20555b01d06528d1018"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
