class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "5.4.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.4.1/meroku_Darwin_x86_64.tar.gz"
      sha256 "2d5e02924851c46aff60ef186699b41f493c4dabab534ccc6b16a052fcbf45f8"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.4.1/meroku_Darwin_arm64.tar.gz"
      sha256 "8edeb3859234b98df86a0e4892815be491351a318cca425a346a73446fea2ef5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.4.1/meroku_Linux_x86_64.tar.gz"
      sha256 "6d8fd64f38f8e06523861cc5e76c22e4c5062c8c216482c8730810b247c853ee"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.4.1/meroku_Linux_arm64.tar.gz"
      sha256 "94b690cffa4a83946917cdb502d0f98b38b1c04cc548ad934c91a9cca4c6551c"
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
