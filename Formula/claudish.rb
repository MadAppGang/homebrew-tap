class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "13.0.3"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v13.0.3/claudish-darwin-arm64"
    sha256 "91f8ec9c5a5671ecaacab5076669ae8ae0676ac5693a53a3b4339fc1dac4a5c5"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v13.0.3/claudish-darwin-x64"
    sha256 "818a333da64c9d586ad637d418af61caf0fff82a79cf9033fbd1f484eb8514c1"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
