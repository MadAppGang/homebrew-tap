class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.19.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.19.0/claudish-darwin-arm64"
    sha256 "33dadd8c1ee603d244e2bee39ed8b4c65d156df95dd4fc01f23e1547b723bb71"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.19.0/claudish-darwin-x64"
    sha256 "9a335b1f57e30f5051c6e5587486ce525678e13b6ffcefeff28bf271291b7c8e"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
