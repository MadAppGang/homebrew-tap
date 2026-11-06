class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "4.12.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.12.0/meroku_Darwin_x86_64.tar.gz"
      sha256 "eb9e374e60dc6780feb9f592b54b3ef3d8fbf3de44ccb7e24cc4b25afcd2877b"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.12.0/meroku_Darwin_arm64.tar.gz"
      sha256 "c3b4feff4167748d2eb346f67fcda3e1cc4839089101718ec0bfbac081456b00"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.12.0/meroku_Linux_x86_64.tar.gz"
      sha256 "f655275a4ea9491a27c36251e8447ae9883fec7ec402402706a6f6d81edb3b93"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.12.0/meroku_Linux_arm64.tar.gz"
      sha256 "f19707c10d667821d41e05254d9a2d5818049b5af0bb62f43adf5acdcddd51a8"
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
