class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "10.6.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v10.6.0/claudish-darwin-arm64"
    sha256 "fe00625d5c23c82e2f6c47576fa1239a128d6df09702ded96420f94c85642673"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v10.6.0/claudish-darwin-x64"
    sha256 "01759202498406ae2f61493c2d75800b7a614f97a9433739f5f8674d344c18d4"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
