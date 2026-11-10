class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "5.3.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.3.2/meroku_Darwin_x86_64.tar.gz"
      sha256 "2537b4a8cacb775d088d449abf0ac39a520f450c1c6a1bff8687221dc0a57756"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.3.2/meroku_Darwin_arm64.tar.gz"
      sha256 "a3a2b22e6ac704726cc08ae3e617969e4687ae95d11457acf697b27441f8e911"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.3.2/meroku_Linux_x86_64.tar.gz"
      sha256 "fc607d895875b11cfac54b820a3c66c1b2ee3f879f32eaf77310d91ed272b5ae"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.3.2/meroku_Linux_arm64.tar.gz"
      sha256 "f2282491cb2e1b717ab8f3a0b408b9f40811bbc655083501b94b3d9a33ffd9c6"
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
