class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "6.3.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.3.1/claudish-darwin-arm64"
    sha256 "6127add363a85b5fce7d779974f3a9b0707fe27dccaff4e618f96e085bb72128"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.3.1/claudish-darwin-x64"
    sha256 "1cd81fec694514d02a28f9d3565eb112d3fd357a3269eb267af13c258a760e77"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
