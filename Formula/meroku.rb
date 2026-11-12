class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "5.5.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.5.0/meroku_Darwin_x86_64.tar.gz"
      sha256 "e4f74eb616a3670215afe801de6ed8e8739ecaa7e40550f22d91197eec092a8e"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.5.0/meroku_Darwin_arm64.tar.gz"
      sha256 "cf770f701ff4e5f5726e3ec9a14894a781faeb3bf6ca7a286134eeddd772ce9f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.5.0/meroku_Linux_x86_64.tar.gz"
      sha256 "f5c535db631b43be9c0d6e4e5db63ce069bf58b98d71f05f97723763298c43d6"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.5.0/meroku_Linux_arm64.tar.gz"
      sha256 "b95cc747ad65c9d768dd52756cdd9e25573ec392a5437942c8ca6ec8ece965ab"
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
