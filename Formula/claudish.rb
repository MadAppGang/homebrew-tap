class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "9.2.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v9.2.1/claudish-darwin-arm64"
    sha256 "15fd20c8a85d25bdad4640c9ff6c7d6dd34d3fc940d674facd0bcfc0cff10846"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v9.2.1/claudish-darwin-x64"
    sha256 "1df8261bc3c14111b648149672812abdb502981b3e952ceed18c00e87b675d1b"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
