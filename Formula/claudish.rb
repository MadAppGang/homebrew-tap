class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "9.2.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v9.2.0/claudish-darwin-arm64"
    sha256 "917389af89a2d8ce26cd017fca420a3f9d4638776ef452ec832ec82fc765b4f0"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v9.2.0/claudish-darwin-x64"
    sha256 "92cb56af0ef285aaeaea19fc466d7032eedfbaeb6699b70ec14120e30c632336"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
