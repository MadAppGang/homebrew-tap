class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.10.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.10.0/claudish-darwin-arm64"
    sha256 "054de62e87413b40d0b6b8508441f8874b7ef32195f29f93d786957171be2344"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.10.0/claudish-darwin-x64"
    sha256 "c358a52c9bc38644928bf5fb1387b25794fb53dae72027eaeb9344b7a77130f0"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
