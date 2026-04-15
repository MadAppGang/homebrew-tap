class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "6.14.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.14.0/claudish-darwin-arm64"
    sha256 "b45bf3fee2bfd7186bf9dea186439eba03e8953ee6b2f3397969765adfb00a94"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.14.0/claudish-darwin-x64"
    sha256 "1a7bd744d42626bce97ca611e08c5443ddb0af97112b1bcf18bab1df9f960d98"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
