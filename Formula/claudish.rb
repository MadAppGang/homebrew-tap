class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "9.0.6"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v9.0.6/claudish-darwin-arm64"
    sha256 "c41b1bb0a65cbc776e8cd12a81c1637fe62f85efb6ad253a4ba57f707fd2d9db"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v9.0.6/claudish-darwin-x64"
    sha256 "4607bbef4a6595f44b53356bd4be3d5e87e0e2e575e253d32cc815ba956e555b"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
