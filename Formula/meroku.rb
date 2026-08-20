class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "4.3.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.3.0/meroku_Darwin_x86_64.tar.gz"
      sha256 "fcad4bf8b04fb48cb0f14757d4e8ba344b4d8cb59aebe3d342ea4908b96dce93"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.3.0/meroku_Darwin_arm64.tar.gz"
      sha256 "ecd8128b79192c0a398e3c3d3b3d27767dcf08bf5b996db4c6c2f9546dda1393"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.3.0/meroku_Linux_x86_64.tar.gz"
      sha256 "c3a15ada830062cef09bbcb8b8beda5844c568b44842131a6fca7c688ab0c4ef"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.3.0/meroku_Linux_arm64.tar.gz"
      sha256 "68bb6af7331d3895a7907f18b07f4dd3ecb6faed01953a758e224a8607da56ee"
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
