class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "12.3.2"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v12.3.2/claudish-darwin-arm64"
    sha256 "e16329ae189b24861d5271bd8bcb6a76b8429535426727ea5c87fef6c88ff0f6"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v12.3.2/claudish-darwin-x64"
    sha256 "3316d041f2ec38fd5ef58a96cce017771a07eb42195a80de2f03230fe6c97608"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
