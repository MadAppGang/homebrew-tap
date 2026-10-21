class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "13.0.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v13.0.1/claudish-darwin-arm64"
    sha256 "dab68eb149935c865e01d48faa8ae07f4e5c2b19997737ef3324a1cfda1ff1fe"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v13.0.1/claudish-darwin-x64"
    sha256 "64c2bb2a799191d4bfcb9b530366a274b1424466cfd3bea6f3cde67f7c0517b6"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
