class Mnemex < Formula
  desc "Local code indexing with semantic search for Claude Code"
  homepage "https://github.com/MadAppGang/mnemex"
  version "0.24.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/mnemex/releases/download/v#{version}/mnemex-darwin-arm64"
    sha256 "b4d65f27b9c754be7456cf3d0d518a4d2b051ccbc14c2b59c2d436685ab60ff5"
  end

  on_intel do
    url "https://github.com/MadAppGang/mnemex/releases/download/v#{version}/mnemex-darwin-x64"
    sha256 "1f75fd5aa932f64f25d535cc77b0292495d07e9629bb68d9bc38a6d7be465478"
  end

  def install
    binary = "mnemex-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "mnemex"
  end

  test do
    assert_match "mnemex v#{version}", shell_output("#{bin}/mnemex --version")
  end
end
