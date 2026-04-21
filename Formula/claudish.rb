class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.0.3"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.0.3/claudish-darwin-arm64"
    sha256 "ebcd3daa664aad6933b8cd8d68f29780910f371ceac2bd05df469509d8e5946f"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.0.3/claudish-darwin-x64"
    sha256 "2d2b1a8b501c4c4827e5caee14708d404566e2c018a40287fe16326801d9016f"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
