class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "10.5.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v10.5.0/claudish-darwin-arm64"
    sha256 "a9ec151054e71ccf3dc03f164d9670e528b297dd38c641d3b5a5fe18ca0cb02a"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v10.5.0/claudish-darwin-x64"
    sha256 "f35cae77d284d209dd04e4443b8cdef8446c3159fe15671dab9d5da0244ecaf1"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
