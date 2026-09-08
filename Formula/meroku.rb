class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "4.7.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.7.0/meroku_Darwin_x86_64.tar.gz"
      sha256 "3d2b5f8996dfdd9039b26b99a215eb504a3e0c580941f83ff65a02a4dae6990d"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.7.0/meroku_Darwin_arm64.tar.gz"
      sha256 "f478647c3b8ed4ce1f4cafa66279057992c4ec759bb6a443fc4db217ff9205c2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.7.0/meroku_Linux_x86_64.tar.gz"
      sha256 "aacec0cad53cd992e9025d9d660bee2170a35273bde9e4d9ea67721c147e5254"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.7.0/meroku_Linux_arm64.tar.gz"
      sha256 "717345c4f05a41f2ee5b1c038a06e74512ec60f811973da8aa72cf13facbcbb1"
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
