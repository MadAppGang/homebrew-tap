class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "12.1.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v12.1.1/claudish-darwin-arm64"
    sha256 "f7782cd304fddea76e8697453e0857baaa07662b5b9b6bf1e4ebce64bb3d328f"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v12.1.1/claudish-darwin-x64"
    sha256 "4dc23deaa8ba1a102dc9df19c134307d0d90ff2650873cd5c2e9037a88684f03"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
