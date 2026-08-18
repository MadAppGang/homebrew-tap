class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.62.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.62.0/claudish-darwin-arm64"
    sha256 "1246c9f0eea202e5d1d7b34edf4dcb158a67d2ed3604d2197acff2020caf473a"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.62.0/claudish-darwin-x64"
    sha256 "ae7e232477525754a8d8bedcbd860e7e46c9cf7cf4c71f8e43e482bbba2614b4"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
