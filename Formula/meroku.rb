class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "5.3.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.3.1/meroku_Darwin_x86_64.tar.gz"
      sha256 "a3ce5dc5608562df03873a530b0ca6ed9c425575ea10cf930919683a05f1d490"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.3.1/meroku_Darwin_arm64.tar.gz"
      sha256 "8b7cab232c47e80b41c521ea208f9388f1f1e79887ea76d35c9d4e43ee0d44dd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.3.1/meroku_Linux_x86_64.tar.gz"
      sha256 "1466515f9e0cfc0f3ebb97335132e76e6d9a11a42303fd566505d3e73c87c4cc"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.3.1/meroku_Linux_arm64.tar.gz"
      sha256 "9f3d658402b2004194bf6fd598119d10eeaa895eef4174662211e311941394ed"
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
