class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "6.12.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.12.0/claudish-darwin-arm64"
    sha256 "3da35a5baef93ab210a56197dbc7e0191bc3761c823602a89239723b1cdc3a79"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v6.12.0/claudish-darwin-x64"
    sha256 "6a7eea5bbe514e0717920215eef632137d23692af16d654b6459da98dbf00e6c"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
