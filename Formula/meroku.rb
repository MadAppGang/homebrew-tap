class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "5.7.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.7.1/meroku_Darwin_x86_64.tar.gz"
      sha256 "cb0216d840732f72733eb05a227a039eebe28422e6d17f9e7e35a5dd902187e6"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.7.1/meroku_Darwin_arm64.tar.gz"
      sha256 "f6271f51bfa64f8fd1d15a74afff921e80fcdba739468ebc6775e6868281c08e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.7.1/meroku_Linux_x86_64.tar.gz"
      sha256 "ea2942386e73f4321dc19ad8970cc4514bc3b4e52b5345025b95eb65b96d191b"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.7.1/meroku_Linux_arm64.tar.gz"
      sha256 "80bf4914987b0cc6cb753ffe2e1734aaca656c92b73b6bb5cb1e004996036279"
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
