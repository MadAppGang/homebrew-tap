class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "6.9.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.9.0/claudish-darwin-arm64"
    sha256 "3a08602d9f0e89a47bd202289337ef7a2bd8856da0c25e481d9aa4e0c2b31d79"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.9.0/claudish-darwin-x64"
    sha256 "6212f77f7746fedf067bb5161eb9cef628037e5aeac6b29220524dcfecdb48d5"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
