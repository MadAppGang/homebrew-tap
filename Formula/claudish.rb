class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "10.2.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v10.2.0/claudish-darwin-arm64"
    sha256 "45318b499796240ccc5f125555430661ba9bc6eb4221202cb030dc4bd7eda85c"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v10.2.0/claudish-darwin-x64"
    sha256 "7c4649a03aeeb62effd20ff81195c49e58d4ca90e340a4e6ca62757a62a4b60a"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
