class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "6.13.2"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.13.2/claudish-darwin-arm64"
    sha256 "b164e5c36d3ff13bc9baa1d3a426df8f8b665959f4feac53e8413d0696d5e0c9"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.13.2/claudish-darwin-x64"
    sha256 "09f57937c1cd142e0061a787139103c1f6d9bd11bc0bc1c27f1858a30b13c01f"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
