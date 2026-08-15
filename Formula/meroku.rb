class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "4.0.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.0.0/meroku_Darwin_x86_64.tar.gz"
      sha256 "5452448ad18fa50977d975479bd615e7847b24236f0d4716dcb3e0fd7932d99b"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.0.0/meroku_Darwin_arm64.tar.gz"
      sha256 "6878b796461b5e53f37b641309327f02d5e3ef93318958e4e6153fee59fc1981"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.0.0/meroku_Linux_x86_64.tar.gz"
      sha256 "a333fbcb4cd2999314cf0d12e3dc75946250e7054252ce8b112cc73095d37f20"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.0.0/meroku_Linux_arm64.tar.gz"
      sha256 "020e0833ccfbec814f020beae8570db6459d68d6b33ef82f8e7edc2a1b5b177e"
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
