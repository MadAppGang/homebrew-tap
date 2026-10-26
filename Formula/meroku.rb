class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "4.8.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.8.2/meroku_Darwin_x86_64.tar.gz"
      sha256 "432409d7238c3dba57dd5c61283b7819a8035ba7fd6e4f21a15317740708775e"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.8.2/meroku_Darwin_arm64.tar.gz"
      sha256 "30a3156f83a8763a5ea8311c12fd46b7dc7a02138512feb0da10f4f3099030e4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.8.2/meroku_Linux_x86_64.tar.gz"
      sha256 "ea6f73c7aa4de070f936e659ae9527dfe37e99c12455d8591b07aecf1d6e89ce"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.8.2/meroku_Linux_arm64.tar.gz"
      sha256 "862bf4cd58d89234aee56211ae9c64f1104be61c54957c65b09153b3e6382033"
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
