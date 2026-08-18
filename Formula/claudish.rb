class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.58.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.58.0/claudish-darwin-arm64"
    sha256 "a170b5489bcbc690ed78307a7463fda979e9542badb6165cef192713a4dcd4bc"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.58.0/claudish-darwin-x64"
    sha256 "36bbc3396898da5f552066b91d6822a5604ce66d4d5d04a4d3e52e4141f0982d"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
