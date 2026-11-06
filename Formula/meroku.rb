class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "4.12.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.12.1/meroku_Darwin_x86_64.tar.gz"
      sha256 "3bc3bc09634da449b2c3383ee4db534ebabb86da480c9dfd4aa036d86a7ec365"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.12.1/meroku_Darwin_arm64.tar.gz"
      sha256 "fb44f900fa0109c6eddf77e35275aac4e8d55c7cf4fe9da91a9c49a58efa567e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.12.1/meroku_Linux_x86_64.tar.gz"
      sha256 "9457e5ce9212f5c9632b2b24c529c1f5a4d9f292ab0e4cc0d3c8178943b11a25"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.12.1/meroku_Linux_arm64.tar.gz"
      sha256 "606f13d187cd25bb7b1e3a2b059f280860f5326d6af8e7386542f9ba8857ebfe"
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
