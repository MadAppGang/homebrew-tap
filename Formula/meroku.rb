class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "4.10.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.10.0/meroku_Darwin_x86_64.tar.gz"
      sha256 "ea4cd0b5a02d8fe1e506140b9bfaf502aec32aae5d65e1fc09af9bd89d86f3ba"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.10.0/meroku_Darwin_arm64.tar.gz"
      sha256 "21439db0813ebee51a6d1c33f4f7c2610ecd04c24942b222cd251a6ec09e4d8f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.10.0/meroku_Linux_x86_64.tar.gz"
      sha256 "6b61e0779b25553d197965260a377e1e1f897f4bd53183fc777dbc1dfbe6a898"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.10.0/meroku_Linux_arm64.tar.gz"
      sha256 "a6629c791ade2723d4ca84621bb61b88813ac0d080f9e67f997478ab0d825bb1"
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
