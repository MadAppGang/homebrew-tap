class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.2.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.2.0/claudish-darwin-arm64"
    sha256 "b669dfa370ffaedf2647bf35421304559cb26b026b3cdddb9729a212fef23c2e"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.2.0/claudish-darwin-x64"
    sha256 "4f55f84fbadcff7f42e267b8ac14a0e040857284aa41b72af6b478e40c4f8171"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
