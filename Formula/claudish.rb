class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.12.2"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.12.2/claudish-darwin-arm64"
    sha256 "10437fa73a6594e38cab8bc2ca1959f01a995749bbc0de75e2feed07bcbbdac9"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.12.2/claudish-darwin-x64"
    sha256 "e26bb362c654837b1950fc4ee5bec0d6364a5490c2c595712c1966442c1c4e83"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
