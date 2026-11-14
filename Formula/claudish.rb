class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.23.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.23.0/claudish-darwin-arm64"
    sha256 "498620d3926a9de8578643fb543788551e77eff7b7cbc8ec272c81231dbbc0df"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.23.0/claudish-darwin-x64"
    sha256 "5b4f2473a640c6682af1207efee24f725a25fc6163966428ff402fcc2fb45a84"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
