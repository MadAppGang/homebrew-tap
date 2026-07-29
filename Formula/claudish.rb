class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.20.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.20.0/claudish-darwin-arm64"
    sha256 "817097013ccd97e90c3ec42ac703cb786ef55988fa35cf02a3e1276915d1decb"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.20.0/claudish-darwin-x64"
    sha256 "7dc38856c97eda535439cc7b7a8d705b1179926b2ef2a3be7381f04464d7c3f3"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
