class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "5.6.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.6.0/meroku_Darwin_x86_64.tar.gz"
      sha256 "8d82b26e973c9f688cec7a017ca3d82e36b64aba50dab5789bd51cb19c446b87"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.6.0/meroku_Darwin_arm64.tar.gz"
      sha256 "13e74d6084791985e8b88b5d72bf17a52ddbf72db4328f9d49a73163aaa16700"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.6.0/meroku_Linux_x86_64.tar.gz"
      sha256 "f6198450ce92de89a9fdb8c7c1c5f4f40c1c0c27acbeb6355acb4997341cd423"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.6.0/meroku_Linux_arm64.tar.gz"
      sha256 "a7d87bc13f9f980ff3a4a852f5664cfdd932eb536d317a04d372201b6c555f23"
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
