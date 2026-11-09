class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.18.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.18.0/claudish-darwin-arm64"
    sha256 "04314b6a49105ef4a2296d210953aadcfb340aa67451f32d2e11be7f66233655"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.18.0/claudish-darwin-x64"
    sha256 "c2c6c764104668602769b83527dd9dedbae78f092f81703624e8d60277d9c350"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
