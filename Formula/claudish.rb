class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.18.6"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.18.6/claudish-darwin-arm64"
    sha256 "ce723e3d79074bdc66ac9b78d6bb616fc3ef2d68416ce75d9c9370d044f03caf"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.18.6/claudish-darwin-x64"
    sha256 "8c3541b648197e38dc183c315b1fc04fb5e8c0de59b0c0e118e0a1aa262e8e36"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
