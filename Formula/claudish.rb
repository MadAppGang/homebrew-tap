class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "6.4.6"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.4.6/claudish-darwin-arm64"
    sha256 "044ff56e7b3ea66a7cd2e241b5c48fbc80cdf191ed9a8d5188c710184872c3b3"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.4.6/claudish-darwin-x64"
    sha256 "b143c90f107592a5b69c3ea8bda15eb63743d89c937337e3ac8155593f48a663"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
