class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "6.4.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.4.1/claudish-darwin-arm64"
    sha256 "4feedce7c08226ce6df3d9fad0c24e6e1fedf7772a22f97c1247c7c6fddbe387"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.4.1/claudish-darwin-x64"
    sha256 "dd70d7b4e2b3cdbdcc38b63e514688122b425c151289af81e342a9680082ccd9"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
