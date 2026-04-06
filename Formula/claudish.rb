class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "6.6.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.6.1/claudish-darwin-arm64"
    sha256 "f7df4effc6070061ca2a14d871fc3f1d69d36897e60cf14566a6f9135f62a016"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.6.1/claudish-darwin-x64"
    sha256 "04a842eecaabe26fb64511c14035ccd1c91b047d1e338385b87d38cf6171742e"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
