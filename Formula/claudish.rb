class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.47.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.47.0/claudish-darwin-arm64"
    sha256 "03d40e4f0ac51339e209312c7eeb0914a7bd1fac2cbae42cdb65d442e7833f96"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.47.0/claudish-darwin-x64"
    sha256 "9f377392d9899f87c2678538fc3e0ff422e1f39e329bd8b58507e1a3361920e3"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
