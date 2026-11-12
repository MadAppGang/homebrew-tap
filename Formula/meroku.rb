class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "5.4.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.4.3/meroku_Darwin_x86_64.tar.gz"
      sha256 "33c66719ec11392bb37a95494125dd742b11e742cb070e4b6a400d5ea1ac8e43"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.4.3/meroku_Darwin_arm64.tar.gz"
      sha256 "28de025ff172fdba0d2ee68a140b1b2783bd7665fcc6ead5901781f3698f1ae2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.4.3/meroku_Linux_x86_64.tar.gz"
      sha256 "8c4469ebfd21de85690cc7a127d2036cdad33fb62e77c9502ee143e662c6a857"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.4.3/meroku_Linux_arm64.tar.gz"
      sha256 "f15ff8c7a061d9f3f40f89c27894023d286ee188a364d72bfc1c94b3fed5d314"
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
