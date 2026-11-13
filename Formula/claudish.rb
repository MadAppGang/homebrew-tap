class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.21.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.21.1/claudish-darwin-arm64"
    sha256 "dc9d663270f9123733a24f0e8123dc911949ce79d7b7c020d6156382ef7e3131"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.21.1/claudish-darwin-x64"
    sha256 "225ca38505caab38f84ceb157af16bdeae268aa3fa5d8b63d8aec48bec0e9a5c"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
