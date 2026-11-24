class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "6.12.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.12.1/meroku_Darwin_x86_64.tar.gz"
      sha256 "435b8e51fe6dc070dd83b419894d9ff85d4be2b9484348baca94b7306d1a2069"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.12.1/meroku_Darwin_arm64.tar.gz"
      sha256 "cae2188e82be13c22ca412f2004d5e1ebdf688a0fc76d67a932ea9c8a8adbd3d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.12.1/meroku_Linux_x86_64.tar.gz"
      sha256 "74a8b5ec1690590c426b3ed78acb4f739e1d3a4fdcc77072b88521b2a43207f6"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.12.1/meroku_Linux_arm64.tar.gz"
      sha256 "b941c87c93545a77d3342c72ca4b96c15db99ed7a63aa6dade522e444c513ce6"
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
