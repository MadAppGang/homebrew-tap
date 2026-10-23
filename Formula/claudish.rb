class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.4.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.4.0/claudish-darwin-arm64"
    sha256 "540be48753b24069ba47da4fa13fad441536462ccc2b179b881c0f4aac96cd22"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.4.0/claudish-darwin-x64"
    sha256 "536f8f4f9444aa164c9d80adf5a2ef082edce4767bb55ec99405613c0f95af6c"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
