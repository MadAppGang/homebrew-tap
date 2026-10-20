class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "12.0.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v12.0.0/claudish-darwin-arm64"
    sha256 "286297af8b44679d6a1f7d3d44742a333de5fa86d8f157776f28edb4d28cdaa1"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v12.0.0/claudish-darwin-x64"
    sha256 "7a00369bd96c229c08b92a591ff5ca3d11afae0c5dfda7209adbfc6c415ff30a"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
