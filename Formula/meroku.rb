class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "5.1.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.1.0/meroku_Darwin_x86_64.tar.gz"
      sha256 "6d59b45b7e8997504897490ff50e2d7725fea1911b017142a624b0d44e47f418"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.1.0/meroku_Darwin_arm64.tar.gz"
      sha256 "c26bb771c2fd18c5efd006c9d96265c25b4083a74264ad631b766c652b91ad3b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.1.0/meroku_Linux_x86_64.tar.gz"
      sha256 "377b300f1418cf406ee0a697a24b5cee977c2ea92463829c07ea147ea3ae3e0a"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.1.0/meroku_Linux_arm64.tar.gz"
      sha256 "ebf2773e6bbd8703364527cd8efee0fcb178008a961fb2ddc2b169980261bd08"
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
