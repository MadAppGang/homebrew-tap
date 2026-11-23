class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "6.11.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.11.0/meroku_Darwin_x86_64.tar.gz"
      sha256 "8d18493afc00ccd413cb56998cceb2a15491e063f31e2f34d606adcc3c929dbe"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.11.0/meroku_Darwin_arm64.tar.gz"
      sha256 "130f5b2b11135ba0e6ca96378ffa1bf82087a6f11a91efac7cffc39adad3836f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.11.0/meroku_Linux_x86_64.tar.gz"
      sha256 "42e46df6221a59aa5b4565565b3d6eebe52b9d23a6377adbfba883cfa01399c7"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.11.0/meroku_Linux_arm64.tar.gz"
      sha256 "7cdaf31dbea1fa4e6655cbaae672edfc138289b34b3113074bab4ad344719e4f"
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
