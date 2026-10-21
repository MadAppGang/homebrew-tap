class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "13.3.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v13.3.0/claudish-darwin-arm64"
    sha256 "7f249290c513ed9127b4e159b32cdc69848e9375ffea891434314d95cd5f0510"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v13.3.0/claudish-darwin-x64"
    sha256 "949c8a94380f341aaf1de0bde1065221c16b889c0ed0bebebfaae274b479f91a"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
