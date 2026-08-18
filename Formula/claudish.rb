class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.56.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.56.0/claudish-darwin-arm64"
    sha256 "4575f39434c34d0cdd07f1c9153fb41d91c1af4a578640d50615d06e7983d75b"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.56.0/claudish-darwin-x64"
    sha256 "70258688cdcd6a31ecc22028d2836961ca840b9cf54a250d200dff3390784a0c"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
