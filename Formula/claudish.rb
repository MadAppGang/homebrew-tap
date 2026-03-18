class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "5.13.2"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v5.13.2/claudish-darwin-arm64"
    sha256 "51e3296e08e692cf924f3bf97f59163582e698cb89a078a3076344b626b5bbed"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v5.13.2/claudish-darwin-x64"
    sha256 "d03739b02d3c912cdb623856bbe7175cb622f93880bde31e77f470f7752d8fb7"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
