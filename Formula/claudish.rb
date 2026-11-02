class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "14.11.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.11.0/claudish-darwin-arm64"
    sha256 "c72b39ca8f4121aac778aff3dcbebbb75d5061b55345c29260b94cac7e92d78b"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v14.11.0/claudish-darwin-x64"
    sha256 "1e350d6896deefa33d445681413e615e854c6c434ae115eceb7a9308b98c54b4"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
