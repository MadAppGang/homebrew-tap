class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "6.0.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.0.1/claudish-darwin-arm64"
    sha256 "683ea32b7504392b9f7fa18eeeb8d2498f75812826950cadb6298cb64010dd61"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.0.1/claudish-darwin-x64"
    sha256 "46d9184e32f5cba285c1bda85d124a3f9121aaff748a76fa5d5a715b700f8628"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
