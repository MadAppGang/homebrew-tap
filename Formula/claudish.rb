class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.7.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.7.0/claudish-darwin-arm64"
    sha256 "838263257926bed3070ea937c3eb20d2118f8c2832ec1bf462c4c2157e9b1b72"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.7.0/claudish-darwin-x64"
    sha256 "0bb005a7a2e8bc609b62076425084b816e691a49d81de2b0b68da27e4ba33832"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
