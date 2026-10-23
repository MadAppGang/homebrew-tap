class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.3.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.3.0/claudish-darwin-arm64"
    sha256 "da6a1eb37a7c01cf828b35fa6d95b14aa1d43c2500621e48f66348f39bdabf73"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.3.0/claudish-darwin-x64"
    sha256 "7502b9838d0dba21f37bb55175abaea57d0c9befc3b14e68edbdd2906468c0c7"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
