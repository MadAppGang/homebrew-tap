class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.27.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.27.0/claudish-darwin-arm64"
    sha256 "91411e0a8d0c06ec3884915eeda0003af4ce1355b8928189926e3d51eddcea73"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.27.0/claudish-darwin-x64"
    sha256 "994b929dc573b4ec23532aa143b2b502446db27be8017f92eb7cbf86370e5f7c"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
