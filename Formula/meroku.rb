class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "5.3.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.3.3/meroku_Darwin_x86_64.tar.gz"
      sha256 "ea798d0b5e8336e202f5d9724befaefcb87b5114dbf432e7c95099450e60b3d5"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.3.3/meroku_Darwin_arm64.tar.gz"
      sha256 "5b17829be4081b55d836313565d7d3e64ace4a989dbb935a5ae45890bcc48b9e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.3.3/meroku_Linux_x86_64.tar.gz"
      sha256 "82b31cd8d5ded439b1bf7ad44dd4f26593b3886eb2e3e9c923d87703c95f44f4"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.3.3/meroku_Linux_arm64.tar.gz"
      sha256 "e456e43424be537c65fdfe7d3b8fd9731b68bd5eb99d12780c263b9f0fdde3bd"
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
