class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "5.3.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.3.0/meroku_Darwin_x86_64.tar.gz"
      sha256 "43a62247cad314ea2a46c57cd65a7ae5a57ef00b87451da0f4e98c18ae74d9d2"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.3.0/meroku_Darwin_arm64.tar.gz"
      sha256 "2774e5c6baab2dcda44053ffd41e6da9ce276d53f603f82eb2012ea4fe122f6b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.3.0/meroku_Linux_x86_64.tar.gz"
      sha256 "1b49e491346bbc1bebc1a055264ea4ce6509aac98bc2b489ad70c6806f8163c1"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.3.0/meroku_Linux_arm64.tar.gz"
      sha256 "8c7761d85506138e68d27ae716841a208444f8317461a62a2d98f4efb4aea024"
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
