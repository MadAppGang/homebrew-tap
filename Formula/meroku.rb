class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "5.3.4"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.3.4/meroku_Darwin_x86_64.tar.gz"
      sha256 "de9aebfb784a64fd27d0892d384726d0333178387c1110b6af8ebb7d227054e5"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.3.4/meroku_Darwin_arm64.tar.gz"
      sha256 "bdfbc90bfa0383ec1b0b74c72761631e3dc2ffbf2d50dbe89a55bf1d13849b1a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.3.4/meroku_Linux_x86_64.tar.gz"
      sha256 "47a7908270496406258208ade57f04ef03470ee4bd442893867d19035ab6e8f2"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.3.4/meroku_Linux_arm64.tar.gz"
      sha256 "aeb9467d5beb1da1184e2994046cb2daf217360f804a3ff884aa5d357dd404dd"
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
