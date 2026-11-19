class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.28.3"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.28.3/claudish-darwin-arm64"
    sha256 "a0ce62c46adfb8ca694e5d54299c5364f79d6221c1e1b0d50016e6bc11fc081b"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.28.3/claudish-darwin-x64"
    sha256 "ac75391064fa3f1c8b34b77a870a1d1a77607ba2984832a425a37b995f4130f0"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
