class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.5.2"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.5.2/claudish-darwin-arm64"
    sha256 "19a1c60a98da15d15bae3a56308e884820e74b5db7ad7e8df0dc5c7124141a79"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.5.2/claudish-darwin-x64"
    sha256 "d50f79f7fe441bbcbf41314ddd0690ede461268d9b3e7f9cc392aaf15f87e00d"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
