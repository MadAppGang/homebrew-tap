class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "9.0.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v9.0.1/claudish-darwin-arm64"
    sha256 "f36c1816add2174973279c9d3d04d94290e86125e74b0fd35707421d2752988d"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v9.0.1/claudish-darwin-x64"
    sha256 "7042a84e093519fed1c0ca1cbf76a0c5e4ed5915ee80fd7d29b13afe47a41d88"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
