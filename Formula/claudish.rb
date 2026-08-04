class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.31.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.31.0/claudish-darwin-arm64"
    sha256 "b30552fa25ef94f444b8517ca234934faf4d403399d2085fec5f06b03c54ed72"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.31.0/claudish-darwin-x64"
    sha256 "bf9aad1b7789dabbf77570906e627283298a5d75bb51d864bfad14654d03c74e"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
