class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "4.6.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.6.1/meroku_Darwin_x86_64.tar.gz"
      sha256 "a2333653ca020b67863af94e90d45a5cd64f7ad56c3ad71aec68b4d537cdb213"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.6.1/meroku_Darwin_arm64.tar.gz"
      sha256 "e56e022530971157b4591f417e18c59ea030e1a74c5a42e9c9ae2f040ca17f4e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.6.1/meroku_Linux_x86_64.tar.gz"
      sha256 "6e996d8f5c60b4cc5aa3e8444addd7932e7999aa07b08af1cf70838ea0d28ce9"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.6.1/meroku_Linux_arm64.tar.gz"
      sha256 "e4a3d4ebbdb96019ab432020ff4c43b4b8649c0b6a16d3edaaf6c3684a44c54f"
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
