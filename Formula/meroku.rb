class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "6.3.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.3.0/meroku_Darwin_x86_64.tar.gz"
      sha256 "ede04d28e5b4423cd8e56f75d86b1a0dbf9b313ca7d317b4d5f76b5aa881dcec"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.3.0/meroku_Darwin_arm64.tar.gz"
      sha256 "e7c9f5366b2a4783f489cbc6e77b82ba847c63216ec9e918e0ff1454787c47eb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.3.0/meroku_Linux_x86_64.tar.gz"
      sha256 "fd9ac16292a2d429498a01e168d462f102c3377feef179e9ed27b8d34401d28e"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.3.0/meroku_Linux_arm64.tar.gz"
      sha256 "c9d699393e3c0a70baf36c690f2e7c9b40983e348b9e0047195a87a02b63e972"
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
