class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.29.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.29.1/claudish-darwin-arm64"
    sha256 "2dd22cc5389d35d1fee7a6415470f9b77b9ce6fb1abd0ec60099954a69630f34"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.29.1/claudish-darwin-x64"
    sha256 "ecb3222e6365bf2fb8a15ea2195fc9f6480277f615d3c3ee85975a4953337ca2"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
