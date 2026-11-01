class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "4.10.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.10.1/meroku_Darwin_x86_64.tar.gz"
      sha256 "726ed591d7fd8bf9581bac137f43bb74fb6d19fe6acc9342024586e82d852b06"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.10.1/meroku_Darwin_arm64.tar.gz"
      sha256 "de25ee4e0f7460eb9d2bf5a5a3459d94c6a79dbb7581fcab8284debd2ca50baa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.10.1/meroku_Linux_x86_64.tar.gz"
      sha256 "258fdfe9bfb6da15e7d7ffd3e5963ebf00c760f775761214486938e9f385a116"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.10.1/meroku_Linux_arm64.tar.gz"
      sha256 "539c14581c32ceb0e5d5f341dc5c3dfd248bd9bcba8a965945259749609b4d32"
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
