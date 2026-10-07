class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "10.4.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v10.4.1/claudish-darwin-arm64"
    sha256 "439ca8a91bb451c7d07f778895af25d8fabadac1ee76f5fc4a4676d0e3bffcbf"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v10.4.1/claudish-darwin-x64"
    sha256 "95a89dbeaae53dee4cbd1ad2166502a0b93d4a5c16b821df4e460abe73027028"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
