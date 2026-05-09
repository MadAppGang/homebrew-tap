class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.1.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.1.0/claudish-darwin-arm64"
    sha256 "a67589a5f8680a21612b88511936fe83e4921734208349b8eec0601f2fe78386"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.1.0/claudish-darwin-x64"
    sha256 "31c6b8220ed25c458f571b531de50cfc68173364be06745ff2d93bae70940c70"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
