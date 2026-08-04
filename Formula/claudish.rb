class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.30.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.30.0/claudish-darwin-arm64"
    sha256 "88b1735ee1c83a1c2e1abbf5107c66480a49a28579ccdc9d42e10f2c9b081c7f"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.30.0/claudish-darwin-x64"
    sha256 "b7218b2c14b591534b27400b1f6bbc193ef3365c71e534c54633ab370e084f15"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
