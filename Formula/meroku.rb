class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "6.7.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.7.1/meroku_Darwin_x86_64.tar.gz"
      sha256 "e1940ec0d0589d222c66656b84c6c64e5c508453079a7e95a7e9975024417610"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.7.1/meroku_Darwin_arm64.tar.gz"
      sha256 "4a353ec8e10ebe1f1d5a553b96be5de5afc1cbe990df90d06b8c72336fd22e10"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.7.1/meroku_Linux_x86_64.tar.gz"
      sha256 "76d4e8927f95fad0a35d9bd39e808ed40fe4f6bae75f11f84ab50edb9a986644"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.7.1/meroku_Linux_arm64.tar.gz"
      sha256 "782460023e72f4e99b1fd21809db2844298a8ce09790756d4a538f7623149fc6"
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
