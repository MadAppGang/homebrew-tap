class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "13.1.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v13.1.0/claudish-darwin-arm64"
    sha256 "556594de39674957b2733fe98d9137f2f2ae3f451ce3302d021d4500d0c328d0"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v13.1.0/claudish-darwin-x64"
    sha256 "c3a7baf0d68bd3a22aaf520a69c0664f7d722b75dd79ede68c05a273b15f9322"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
