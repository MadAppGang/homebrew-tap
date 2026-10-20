class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "12.2.2"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v12.2.2/claudish-darwin-arm64"
    sha256 "b3369c318df3a29282d35b18ac0778874eee9505518c743ab97581e8552b3154"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v12.2.2/claudish-darwin-x64"
    sha256 "8459a06b19527612c2a0a5e850b9075d0a592ab5ecbf8cc32ed1e1b765df9e05"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
