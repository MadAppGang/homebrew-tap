class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.60.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.60.0/claudish-darwin-arm64"
    sha256 "1020f2cf4fc326b6f49c75cc82962d1c4936d80f87845353457880bad56b095d"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.60.0/claudish-darwin-x64"
    sha256 "525004706c5bff50aa4dec87189e2397e4b23ed5fd61157ef51f7b0151899271"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
