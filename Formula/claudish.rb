class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.0.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.0.0/claudish-darwin-arm64"
    sha256 "437b6a1fc65c351c50c0d298047cfe08de03e921739a58ba03d108a77d811ee4"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.0.0/claudish-darwin-x64"
    sha256 "b07c091cedd09d7ad5635abb41fbf75513f8d53f695b878bfa1ba152f0fd1013"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
