class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "6.7.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.7.2/meroku_Darwin_x86_64.tar.gz"
      sha256 "ccbff2d16fd0bbe97163766cbef57b110e7f9c3ec5637bab8587b86635276f18"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.7.2/meroku_Darwin_arm64.tar.gz"
      sha256 "c00749b03f5a7c673207098a1ad32b5986b61adf95d408028dd3613430814abf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.7.2/meroku_Linux_x86_64.tar.gz"
      sha256 "c8d123cf396a3eaadb0b7dceb8c0f03baa904a7a8ec15ee70a719a1b6507bbbd"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.7.2/meroku_Linux_arm64.tar.gz"
      sha256 "dca242086c74672e5b96911c6c83273c31135fbc088e7f3b92f8f62be889ae04"
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
