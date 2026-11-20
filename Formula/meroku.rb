class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "6.9.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.9.0/meroku_Darwin_x86_64.tar.gz"
      sha256 "b217e2d2c45f7ace25be32f3802b7f26f7d85139b7915a90ad54dadf7ca85a93"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.9.0/meroku_Darwin_arm64.tar.gz"
      sha256 "a28b3f54c0751ef02aaeca6c8125140c8a8e285a110e6aba32c11caae7ca8ea5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.9.0/meroku_Linux_x86_64.tar.gz"
      sha256 "fbcc6aae0ea54fb65a8828293ba095f8957d891b70090c43c921f46aee0781fb"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.9.0/meroku_Linux_arm64.tar.gz"
      sha256 "4dbb31943b1f0db631d67fa8f47e8e5b8dc5b26e7de343c0bbf0daa2a243c035"
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
