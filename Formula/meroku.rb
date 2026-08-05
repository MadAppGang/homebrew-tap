class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "3.26.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v3.26.0/meroku_Darwin_x86_64.tar.gz"
      sha256 "76f0440c052aa6c33c94e27c090c4688139cf19a40859703f00ea131bbb1b752"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v3.26.0/meroku_Darwin_arm64.tar.gz"
      sha256 "8da672074680452dce9d92b7a275d2c4adbfc90de84a3d42262af1106df4ba9b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v3.26.0/meroku_Linux_x86_64.tar.gz"
      sha256 "ce539faa95934d4cf57acbb7c3f4428a2877ea3c36a053f796cdc037f22ef9d4"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v3.26.0/meroku_Linux_arm64.tar.gz"
      sha256 "4b87796ccdf4fdc8f086ed7acef7d8b3d55e2283c0081e5fc5caa938ff989df0"
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
