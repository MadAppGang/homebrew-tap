class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "3.27.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v3.27.0/meroku_Darwin_x86_64.tar.gz"
      sha256 "927ca610927140d5c1589a708ca3ee6f2053af68ce1bbffa4df6e920c1679eb4"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v3.27.0/meroku_Darwin_arm64.tar.gz"
      sha256 "76d372677919ea86b8eca3f8a8b860c22a89dcbcc594630544c3c167dc22be5f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v3.27.0/meroku_Linux_x86_64.tar.gz"
      sha256 "7e6172ea1086190dbfcc5d0e06d2e80dd9b575f81a8f9d51647e46a4c86c8e14"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v3.27.0/meroku_Linux_arm64.tar.gz"
      sha256 "1c5e632f137bcd112a5104338bedc7d0ca465bfedd334e6a8049adad580030e8"
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
