class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "5.2.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.2.1/meroku_Darwin_x86_64.tar.gz"
      sha256 "a8a271fc9153e3829d5208264647bacf59b81eb9ac9c1dc119281ed474c93535"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.2.1/meroku_Darwin_arm64.tar.gz"
      sha256 "6519fe7084039eae90c37604df5f16189c94cec18076174ef2d3a99f49dd426d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.2.1/meroku_Linux_x86_64.tar.gz"
      sha256 "9c83198091a1ee58c158cb7332cd82d411d763ed3a162ebe496b251221b0c5d2"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.2.1/meroku_Linux_arm64.tar.gz"
      sha256 "b4b08a498ef04efd49cc883ed92add52025c529f5d5c63a2691d69dc69ca7b98"
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
