class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "9.3.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v9.3.0/claudish-darwin-arm64"
    sha256 "c08e4a9be9f69f0da90fdc0a759e7271d0b6e6a7c32c6eb7dc99164bdfc440a4"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v9.3.0/claudish-darwin-x64"
    sha256 "d35fb8cf4594e29252368b17fa1cbc4f8bcc6d6886d60fd42fb869aa05ba9a73"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
