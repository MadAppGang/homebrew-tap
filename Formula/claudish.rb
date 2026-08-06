class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.42.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.42.0/claudish-darwin-arm64"
    sha256 "aa00190d520614f9a812f6845d7315c3db0c513fef98196394a2a20ffe9c2a12"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.42.0/claudish-darwin-x64"
    sha256 "64966803a3aaf366e94ef1f0401bde8749ea7819c2a741df83c0b0270e2b9db9"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
