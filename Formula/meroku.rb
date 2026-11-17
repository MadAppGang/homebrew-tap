class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "6.6.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.6.1/meroku_Darwin_x86_64.tar.gz"
      sha256 "44399268cf6716f2f8b329a82357537614a6d97662636dee0f521dea0780822b"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.6.1/meroku_Darwin_arm64.tar.gz"
      sha256 "4f9d159ff4945292b15bfbbec906ca56ef23d8fe1202f1595108306eca4e063b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.6.1/meroku_Linux_x86_64.tar.gz"
      sha256 "42c3a732017c49804037210ebef2058198e514daf9e76a0d65022ae097624736"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.6.1/meroku_Linux_arm64.tar.gz"
      sha256 "196185a6e045386d72e500c75c33f08f3a6de68a81a98ed5fe3a10de45599eb6"
    end
  end

  depends_on "terraform" => :optional
  depends_on "opentofu" => :optional

  def install
    bin.install Dir["meroku*"].first => "meroku"
  end

  test do
    assert_match "meroku", shell_output("#{bin}/meroku --version")
  end
end
