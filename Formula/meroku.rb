class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "4.6.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.6.2/meroku_Darwin_x86_64.tar.gz"
      sha256 "212cd470eea9b5b5feb59d253c3bcbf5290966f7c249c43b3c84765c8c1cf234"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.6.2/meroku_Darwin_arm64.tar.gz"
      sha256 "35769eb565deb33d392c778d9c0c35314efdb88156b280f621cf6e92357c4434"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.6.2/meroku_Linux_x86_64.tar.gz"
      sha256 "e799f85efca8293f5d09c241efbc45586af83e5e2ec45a649127d506bac08cf1"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.6.2/meroku_Linux_arm64.tar.gz"
      sha256 "1c66dd2323601b7152e41fb778b29810b0458524bf874ddb3750d8f378675f92"
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
