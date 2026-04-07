class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "6.10.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.10.1/claudish-darwin-arm64"
    sha256 "ab23fa9676f36a14515543813a0924570a8f5aed2b09ca052d6745d4c2427fa5"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.10.1/claudish-darwin-x64"
    sha256 "99814424551b3e268f69bddf6657e3947a1d83202d62474c71b6f666a81b6c1f"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
