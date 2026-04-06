class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "6.9.1"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.9.1/claudish-darwin-arm64"
    sha256 "348c8e4d102a4602aa3b1479e55e1d4d38e810e21ca22212499f17b17071ee3e"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.9.1/claudish-darwin-x64"
    sha256 "5c33b276500e9607ac5fd50ac924479d06db761a14a609b2d42e2170ddaef9be"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
