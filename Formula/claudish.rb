class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.67.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.67.1/claudish-darwin-arm64"
    sha256 "48a768337d33726b310d063aa0ae22e984fd5558eead490f05a1afb1a35d8be7"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.67.1/claudish-darwin-x64"
    sha256 "cb99801477f789c065aa6a2dac1b77425d3db8523980ef1f768d35f5a7fbbe68"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
