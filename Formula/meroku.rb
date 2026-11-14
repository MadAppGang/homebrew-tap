class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "6.0.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.0.0/meroku_Darwin_x86_64.tar.gz"
      sha256 "c02b060d8578d5a4aa5ad350d374bd7ec25293baad44d9be76ee28c3f4621fa9"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.0.0/meroku_Darwin_arm64.tar.gz"
      sha256 "ea4b4dbc34bce4a57f25ae59838cab24732f8353b2562238a7e1020e49c3b242"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.0.0/meroku_Linux_x86_64.tar.gz"
      sha256 "7d60130f3bd9c208ae12498eadbf5e15ad8d5828ee42a359d1c3b7e70b97666c"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.0.0/meroku_Linux_arm64.tar.gz"
      sha256 "9981f117e7f4a5d6c3f9d351e58837a5cc4f766f561d0bd3bafdb52b60d72ffd"
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
