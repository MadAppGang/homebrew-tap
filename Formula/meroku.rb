class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "6.9.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.9.1/meroku_Darwin_x86_64.tar.gz"
      sha256 "9576ee7955096e5450693ddcab420c0085e15273343540bca71ed81fd509d937"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.9.1/meroku_Darwin_arm64.tar.gz"
      sha256 "8c081968ed7b09c15f6ffd4a5bc30b6b43b7a7d7f5d6caba9e417a365453b12c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.9.1/meroku_Linux_x86_64.tar.gz"
      sha256 "0a5a98318600b3831bcf717fd3fe5c593f67065a5e10bab579d9ae3dd28be264"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.9.1/meroku_Linux_arm64.tar.gz"
      sha256 "c2cbe0db8af5f1b2091bff0b4603366f8fb14024370521a4418acabe081ae3a8"
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
