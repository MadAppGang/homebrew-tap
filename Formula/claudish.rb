class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.7.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.7.0/claudish-darwin-arm64"
    sha256 "fe292d837c05bccaa63398b091b97401f880c65ec29501f4a4c7e1bfae1c09f5"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.7.0/claudish-darwin-x64"
    sha256 "3d4074498d4495a3d27fafe56403466422104c2336740a615487039a741787aa"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
