class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.12.3"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.12.3/claudish-darwin-arm64"
    sha256 "f06b0c20cd195426ec2f26fde8a54bfc062043494aaa7835e89a680794862c3d"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.12.3/claudish-darwin-x64"
    sha256 "f4b30b6123fb7f550ab17c6d69641e12682bcf416077326ea71b3bc25af66f4c"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
