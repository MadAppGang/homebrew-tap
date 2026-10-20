class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "12.3.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v12.3.0/claudish-darwin-arm64"
    sha256 "44cd45cc790dac130c9655c58fac2ebf081f21cb9b63ed0b0a927dd94bdfa8bf"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v12.3.0/claudish-darwin-x64"
    sha256 "a5f1f8705b2ce8bef3cdf32a38464bc94bdfdb673914407e19e35abebe85d9e0"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
