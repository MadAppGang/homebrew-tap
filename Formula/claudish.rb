class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "6.4.2"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.4.2/claudish-darwin-arm64"
    sha256 "9c2386ad9d745e1950735fe058501e13f579fa4e75a79df4ee080065d6eb23f4"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.4.2/claudish-darwin-x64"
    sha256 "3b40f9d8ce78d1c9f52a8d1346740dcecd4a8588e2db38848d78932d6ecb7203"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
