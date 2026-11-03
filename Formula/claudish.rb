class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.12.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.12.0/claudish-darwin-arm64"
    sha256 "9906b1431be59449449d133ff869b7d17754235ed349d793d84e6eb314a2edd8"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.12.0/claudish-darwin-x64"
    sha256 "9fb1d41fe9069716fe240ea6258e192c9a54a04955d84e41b1295e6e2cf21a50"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
