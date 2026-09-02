class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "9.0.2"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v9.0.2/claudish-darwin-arm64"
    sha256 "c28199b404ab335baf922e00d4cb44578fed9e3bed78bc90a71048dd24a87953"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v9.0.2/claudish-darwin-x64"
    sha256 "913c04099996188c3e97e4d08cccd59ad9f55aad07603714cd1c66017451ef24"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
