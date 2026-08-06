class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.40.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.40.0/claudish-darwin-arm64"
    sha256 "eb66b66fa535c39d98249c96250bc40304f34f273620408e2247202087693ab8"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.40.0/claudish-darwin-x64"
    sha256 "3980b5413cdc410869167c84a1a4dc55ab416a587606aa8271abafb919d491fd"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
