class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "13.2.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v13.2.0/claudish-darwin-arm64"
    sha256 "2c035eec9fdf0cc5ebf6cfa69391d292e98be74ac3101e521f41a66cc8c56929"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v13.2.0/claudish-darwin-x64"
    sha256 "769d65ac24995b8ea1561ee085df8a60cf92cc782fd5dc95bfc1890c7e053003"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
