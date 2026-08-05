class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "3.25.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v3.25.0/meroku_Darwin_x86_64.tar.gz"
      sha256 "723c301a356e450712b7941783488be292f16cc2ae7c907db9606ba089634dc4"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v3.25.0/meroku_Darwin_arm64.tar.gz"
      sha256 "98a06f1cdaf163e99e361b28caffffc6b28b112248d374c387189022ba0ba416"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v3.25.0/meroku_Linux_x86_64.tar.gz"
      sha256 "248fbfb10d4c2578590f319482783ea69505123b009d8fdac2f6f58a78c231d7"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v3.25.0/meroku_Linux_arm64.tar.gz"
      sha256 "77ea45208aec4c9465b3a8f3eb0069889491652d57eccddb6155895214c64c51"
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
