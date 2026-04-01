class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "6.5.2"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.5.2/claudish-darwin-arm64"
    sha256 "75d723d6048db2007202092ae9cde2f45d64ed61acce47f38b2f6734420fb9df"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.5.2/claudish-darwin-x64"
    sha256 "9e8ca5101bbcc65dd6834c50ffd619ee1ce50b03b39cba1918ad44fb9195444c"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
