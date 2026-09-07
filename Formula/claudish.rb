class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "9.0.5"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v9.0.5/claudish-darwin-arm64"
    sha256 "31c18abfd5c940cac0a97ad2dc0230639d2a0baa2eff888782748606ff089178"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v9.0.5/claudish-darwin-x64"
    sha256 "b06a6b828222f3572976fefb8b4297461f5efc1c8a89822e21024664a62a7fa8"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
