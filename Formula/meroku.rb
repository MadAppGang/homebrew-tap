class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "4.8.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.8.0/meroku_Darwin_x86_64.tar.gz"
      sha256 "6f990f79677c4f59077abb2b2c779c65484878baa1a032ef4b89ed6e7f02e055"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.8.0/meroku_Darwin_arm64.tar.gz"
      sha256 "2a1f36290e23a553695328ec987af2c3e848bd0bd53e17d0f484fcfabb86d5c3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.8.0/meroku_Linux_x86_64.tar.gz"
      sha256 "8d33f7cb76cd7c8ee78ed9ba000d085893e04d2b64e1947add6a189be76902f0"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.8.0/meroku_Linux_arm64.tar.gz"
      sha256 "a9dd190feadf7a322a9c503ab0828cf7920c11a88582c31de508743d2660f54d"
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
