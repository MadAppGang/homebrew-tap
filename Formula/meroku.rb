class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "4.6.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.6.0/meroku_Darwin_x86_64.tar.gz"
      sha256 "a5bca974f78a6fa088c5965fd1f6d11fccdb5a18edcbd39a7a9fc852da8d3441"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.6.0/meroku_Darwin_arm64.tar.gz"
      sha256 "4170159bc02963ab9ea17134002d59e04d810a46ec1d54b04581e9fff206cef8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.6.0/meroku_Linux_x86_64.tar.gz"
      sha256 "e17239621c8df0bd987ddc1cfa611b37fc442e6208b34ad0bfcada4990dc5ed3"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.6.0/meroku_Linux_arm64.tar.gz"
      sha256 "8387e7f75d74a135c081a527728a027f69e078e0cb05c625708225e0a63041a6"
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
