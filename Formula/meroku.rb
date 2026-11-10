class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "5.0.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.0.1/meroku_Darwin_x86_64.tar.gz"
      sha256 "d409a75d01043ebff63a126f43ee8e2262ba040157cc9e79b7216cc574c10b1e"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.0.1/meroku_Darwin_arm64.tar.gz"
      sha256 "9b713a50dfc3b64c4e1d9da22642181dc6fb1dce3303566996702564d74cf92f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.0.1/meroku_Linux_x86_64.tar.gz"
      sha256 "cf0460cd7f09040876d0c1023d43046721533e27dbff37cecf7e6bcf8f1d8eb2"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.0.1/meroku_Linux_arm64.tar.gz"
      sha256 "f43b3c65c1c68d081d97d2ed44a42a53f020d84bf6b0492a52458644e626d43b"
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
