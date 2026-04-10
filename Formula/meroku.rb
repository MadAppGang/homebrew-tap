class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "3.23.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v3.23.2/meroku_Darwin_x86_64.tar.gz"
      sha256 "d2f92c834415036f206e07d228e39cc00a744642fdc5cf5a0539cc59db1be599"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v3.23.2/meroku_Darwin_arm64.tar.gz"
      sha256 "9c3a0a75018ae147a4a9b0490420e4cfa3f50bf3af50009338a8f24691e09538"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v3.23.2/meroku_Linux_x86_64.tar.gz"
      sha256 "5dd6b1cdd91136bd2228c00829c37800836e4290a533d62b5c4c489a8b5b5975"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v3.23.2/meroku_Linux_arm64.tar.gz"
      sha256 "3bb40f14d547f283d93233c43c8283f007689109ffe643e0bb01b27a4d9ba2d2"
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
