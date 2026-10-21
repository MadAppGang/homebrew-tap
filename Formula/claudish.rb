class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "13.4.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v13.4.0/claudish-darwin-arm64"
    sha256 "6e52867dd899e8b61bb778a04380fef307f64e70c90bac3875833843323e0129"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v13.4.0/claudish-darwin-x64"
    sha256 "ee14241e3ecc5e24bb567a31405de7c3e6acf53493d75cbc5c2c14c7bc1b7677"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
