class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "10.7.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v10.7.0/claudish-darwin-arm64"
    sha256 "d57a13504255ec51ec65a91cb98ab83639b73be67311843580e9e633ffbd47ce"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v10.7.0/claudish-darwin-x64"
    sha256 "7925ea39886be864b05747a8245e19ab36327e61265c486a0efb8e9c8093f6dd"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
