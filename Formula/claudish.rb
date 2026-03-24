class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "6.1.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.1.1/claudish-darwin-arm64"
    sha256 "03a86eb1cade4fa6bface45d635f7a6190836b0df3e454c21763461b46d6499e"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.1.1/claudish-darwin-x64"
    sha256 "50c500d813841d5ea3cc10aa527d7fb205197c76d441823e9cd890695ac300bf"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
