class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "6.1.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.1.0/claudish-darwin-arm64"
    sha256 "1291370d2a34634437ee2ce2181d5f28b0275bef8279b8e2b565105fd6002e77"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.1.0/claudish-darwin-x64"
    sha256 "82bf6168528a06c6596cb3eb85f056e336ddbda88b7bc8f2e9bf68501da0fc15"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
