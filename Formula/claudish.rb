class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.22.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.22.0/claudish-darwin-arm64"
    sha256 "cac8e166ec5cd9628112655188ac53b5559f97a6699a74f8689d43d302ad89ab"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.22.0/claudish-darwin-x64"
    sha256 "7c43444bdacdd4ba87fe1baa418288efbfbd7d4036cae34e7dadf0ec99a983d8"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
