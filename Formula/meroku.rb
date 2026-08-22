class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "4.3.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.3.2/meroku_Darwin_x86_64.tar.gz"
      sha256 "c12b1b6a481e3e518830a65c232bf7990abe5d68c973d583e74811d8d4b85ec3"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.3.2/meroku_Darwin_arm64.tar.gz"
      sha256 "84bb824896e54d3561f074c533e3bf1aaba5ef1311f0c83a1bcba72d60b25674"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.3.2/meroku_Linux_x86_64.tar.gz"
      sha256 "926a3d9cb4473a9f0a4a55c11004394809eb2de2fee29482ea4aaba681ef78ef"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.3.2/meroku_Linux_arm64.tar.gz"
      sha256 "88efa304e44f611a76a9143c2406c9888bbe8c943a70d24a42f80336946dba18"
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
