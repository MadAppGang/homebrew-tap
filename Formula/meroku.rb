class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "4.10.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.10.3/meroku_Darwin_x86_64.tar.gz"
      sha256 "d12cc1958df11cadfaf255a474729fcf1af2cf382bcee4c341378915101e6738"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.10.3/meroku_Darwin_arm64.tar.gz"
      sha256 "9bda7b756883d2edbeccc438b3175beca82f09c54a4de89f193dcfad7db9d2ab"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.10.3/meroku_Linux_x86_64.tar.gz"
      sha256 "5428fb6882ebbea192df2c9bec451d46709c0f28e07418a857c227f005341040"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.10.3/meroku_Linux_arm64.tar.gz"
      sha256 "c5645390cf3e96fcd4ec1ca17e4220186a21e64bdf2bb2deee7b76a0fd3ab4b7"
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
