class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "10.6.2"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v10.6.2/claudish-darwin-arm64"
    sha256 "10e424a278fe6968a544d9a1fd1264982d93750f25ec5b47b28837ae5174a971"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v10.6.2/claudish-darwin-x64"
    sha256 "17b2687233a224add5f7fd966f97a9619f9344ca9d04d338ee1bbe70d9f0f0fc"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
