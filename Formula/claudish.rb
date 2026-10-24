class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.4.2"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.4.2/claudish-darwin-arm64"
    sha256 "0437fce6f94270efaa0497f43fdf7d0aee77827bb9f652c9c63432f7d40d70aa"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.4.2/claudish-darwin-x64"
    sha256 "10cbcaf80de49789f436f32db131027144ad54468c4a97abaa2f89050cf3d86d"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
