class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.8.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.8.0/claudish-darwin-arm64"
    sha256 "759e637df92749ae9d1e78ba707387f49783b20d6dd6150b65d1830a8232ba20"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.8.0/claudish-darwin-x64"
    sha256 "f7d642ba5e6554052ed1d6e55792fd7c7ff1738aee07b2a0b32a881ecc74036b"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
