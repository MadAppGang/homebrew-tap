class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "12.0.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v12.0.1/claudish-darwin-arm64"
    sha256 "4297abbaa1df2601f995defcc64f2634add646bd0f5a576104399f7be53649c7"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v12.0.1/claudish-darwin-x64"
    sha256 "f3d4094c9ddb2119a02eca6834562d4ee738c985c38bffd041286c23e370d0d5"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
