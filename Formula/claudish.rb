class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.12.7"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.12.7/claudish-darwin-arm64"
    sha256 "18c7651964d22011aadfc6df348080f2988dd67dd5e347f6c49430d8f0022185"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.12.7/claudish-darwin-x64"
    sha256 "a31ef7a8c4afe6841ea92cfb396e96244fc1f1fe87d484528f6f909acc314479"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
