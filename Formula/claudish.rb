class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.46.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.46.0/claudish-darwin-arm64"
    sha256 "8d6eb5eb128dfdc72477be2e716971ce611907d6fa9f0ca32ac5e48cd5cf0e5a"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.46.0/claudish-darwin-x64"
    sha256 "b66c8c61fd08da5ef27bd4ab4ea61a227556c300b92392546c128b2ee72500cd"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
