class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.45.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.45.0/claudish-darwin-arm64"
    sha256 "f62f55239feaeca545c41d38a5030bb8f6f18528c48f9c8196733a99c19356ac"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.45.0/claudish-darwin-x64"
    sha256 "6424bbb1370d44af9f59da2e58110c5bfab57039371b08ee6e2b6bbb7917376c"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
