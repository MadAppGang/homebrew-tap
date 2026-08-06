class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.43.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.43.0/claudish-darwin-arm64"
    sha256 "d94b70c703affee6d95ec5007b00204fc8f6020217516bb63f3a9a908af83ba3"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.43.0/claudish-darwin-x64"
    sha256 "c28faff629eff0c96bae36f154827f1e103359b98ffcd5b5486f9ea33ad2405b"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
