class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.18.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.18.1/claudish-darwin-arm64"
    sha256 "38321266e82e018ba9be695d12b05bac6ad4a425075bcbbb86c29937c46b9157"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.18.1/claudish-darwin-x64"
    sha256 "1344953833c2b91bf5da838dcebf33d37249f148dfb2290c756ef406e763ea6c"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
