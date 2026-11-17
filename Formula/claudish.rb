class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.28.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.28.0/claudish-darwin-arm64"
    sha256 "f8aa24a363cf2be934f01a7932c779fdfa24c2b618ae0313f1399557db7b4ea5"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.28.0/claudish-darwin-x64"
    sha256 "0823733417a8a7f159a162ef097542b7e1eaedbb03bee4b01b3ecc130841cdf0"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
