class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.63.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.63.0/claudish-darwin-arm64"
    sha256 "911c8ca41d80f8d7058df11e8e65b58513b3f7c42f693902319ab791f23fcaa4"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.63.0/claudish-darwin-x64"
    sha256 "0043eb737db85e79f772562d519ec0488bb81173ec1d02f7cfd35c568cb13779"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
