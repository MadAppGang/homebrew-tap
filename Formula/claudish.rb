class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.64.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.64.1/claudish-darwin-arm64"
    sha256 "bcb39e64297e9f711e33a6715e8ea5a9e89cb5e89aa7ab03be7b35dedfe1bd31"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.64.1/claudish-darwin-x64"
    sha256 "736ef9596b7aab9f87ca3ce283cd0a402f22a0b60f91097f91950dbd07256793"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
