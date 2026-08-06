class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.41.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.41.0/claudish-darwin-arm64"
    sha256 "0768430b83e8db187553be3db8b3549528e26ffeac924587fd53ab3485028b9d"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.41.0/claudish-darwin-x64"
    sha256 "7a9499684481b33a4ad409131385d3acdb80aca5f72198bf2ac83fad63aaa760"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
