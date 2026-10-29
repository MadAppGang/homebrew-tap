class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.10.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.10.0/claudish-darwin-arm64"
    sha256 "8db97388affbba1d32a566ee44754563856574a450cfc97e2f104915e3f25ce5"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.10.0/claudish-darwin-x64"
    sha256 "fabd3bf632cef8b232966d4e6215c92ac080150757050f3201dbbd4303fe7399"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
