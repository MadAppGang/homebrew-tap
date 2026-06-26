class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.7.4"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.7.4/claudish-darwin-arm64"
    sha256 "566e700a69d29a59ab47b98e116a0fe88aeaaccbe81cff77f3369f7a0e5afeb6"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.7.4/claudish-darwin-x64"
    sha256 "e2fe3a465ef50e50e381062cc9354b63ebbb79af6e21d20dc24131976407d824"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
