class Claudish < Formula
  desc "Multi-model AI CLI - run Claude Code with any model"
  homepage "https://github.com/MadAppGang/claudish"
  version "7.38.0"
  license "MIT"

  on_arm do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.38.0/claudish-darwin-arm64"
    sha256 "177b7079dbfb3407a53d28bf3afd462e9a6e3d56419c63ecff5b34a01f176843"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudish/releases/download/v7.38.0/claudish-darwin-x64"
    sha256 "44e5b80751861eef03b28084ee0cda4f154c2b56eff5263e022a004dc98f4429"
  end

  def install
    binary = "claudish-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "x64"}"
    bin.install binary => "claudish"
  end

  test do
    assert_match "claudish", shell_output("#{bin}/claudish --version")
  end
end
