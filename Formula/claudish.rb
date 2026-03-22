class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "5.18.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v5.18.1/claudish-darwin-arm64"
    sha256 "131916e3183fb73321d32be2c2b0655d00c546cccbf19bdfed111d40bdafb3aa"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v5.18.1/claudish-darwin-x64"
    sha256 "f2fd0886955a06ac173dce96d713d0d28f3d610145144f007253601272fb739a"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
