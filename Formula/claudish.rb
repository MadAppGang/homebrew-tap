class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.28.2"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.28.2/claudish-darwin-arm64"
    sha256 "45a6398fb245dfb354150646361ee9675776453d72512bf820da99315d3b5091"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.28.2/claudish-darwin-x64"
    sha256 "5dee2c5334efcfe5036b5ae0020b65f9f3b01a64464e508e266dc5c8087999c1"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
