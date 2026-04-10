class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "3.23.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v3.23.1/meroku_Darwin_x86_64.tar.gz"
      sha256 "696a2e4ff76ca29b264f26b6846eb47aed9fbe0e253b98cb33307b15e791673b"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v3.23.1/meroku_Darwin_arm64.tar.gz"
      sha256 "b25139270417fffdda25d7cf2830fe350bf9ae850fbc13a8d7fee4f9873e91cc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v3.23.1/meroku_Linux_x86_64.tar.gz"
      sha256 "7b7ad60f2536afea9fe407a38585a377428e7a845e05480469a6ca7e98e20eea"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v3.23.1/meroku_Linux_arm64.tar.gz"
      sha256 "a17a2550dcb11f4feaeaa2d8c65cac4b6983d5f8a8ae59d0e1ececa3e07afd8b"
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
