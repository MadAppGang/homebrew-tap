class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.2.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.2.0/claudish-darwin-arm64"
    sha256 "7b7fe1252f1a042aab22ba61c09877c85313de53d90d1e6146fae7f54aa89a57"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.2.0/claudish-darwin-x64"
    sha256 "3b5920593256b492be31f4e0c5fea5563e7e1a1ca37ec28349055362f4bb3e41"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
