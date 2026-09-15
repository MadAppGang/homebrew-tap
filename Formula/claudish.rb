class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "9.4.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v9.4.0/claudish-darwin-arm64"
    sha256 "72612f4420b5b0aede7b450653e01d32255ebacc9e243114c1eb54d53c847629"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v9.4.0/claudish-darwin-x64"
    sha256 "05dd580eb4552938c5bb70df546307aa65b7e8ba61ecbc60dd2e25914829d692"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
