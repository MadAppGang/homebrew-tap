class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "5.16.2"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v5.16.2/claudish-darwin-arm64"
    sha256 "c85cfef00e9321edfc02748d4ee268b621622b08dfea6200879ab2f41ce8c191"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v5.16.2/claudish-darwin-x64"
    sha256 "a898fc51521dbfb2d442901f3b521da90b9aaa0d208af746bf023af3bba73574"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
