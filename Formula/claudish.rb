class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.6.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.6.0/claudish-darwin-arm64"
    sha256 "7b5257df8e9111c8ceb84557c98ccedc66704c9bc3040343cdd33a83727b81be"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.6.0/claudish-darwin-x64"
    sha256 "07db0b8afc24cf2036e58e60f702c3a93370cbe83a76f185aa33d424a5d020a0"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
