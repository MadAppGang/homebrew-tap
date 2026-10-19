class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "11.0.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v11.0.0/claudish-darwin-arm64"
    sha256 "51713f65bea2a072b276a862e870298aa0711edddc74fb0f1bdbece1585d2cc4"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v11.0.0/claudish-darwin-x64"
    sha256 "87742c33b54c3f97650935fd93cd037b4113c6540b772b969aaf8ca4e19d2c5c"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
