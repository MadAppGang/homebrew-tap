class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "6.0.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.0.0/claudish-darwin-arm64"
    sha256 "7b27752a57074958d68f32225eb0e5b784f560737e5795c91f621f6668bb7a4d"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.0.0/claudish-darwin-x64"
    sha256 "7ad172f776cbfc9d9bc11d4c8d92d1588b05eccf8efa219a783ac67cafadb67a"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
