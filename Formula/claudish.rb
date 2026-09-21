class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "10.0.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v10.0.0/claudish-darwin-arm64"
    sha256 "4fa86b90cdf42e6175a382cf67be30be04eb9d6b4c08689cb8d126035f089a9b"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v10.0.0/claudish-darwin-x64"
    sha256 "6efa67478d9fe6edf7fe206d1b3a6636a3c71e100f950647db11618d0e883de2"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
