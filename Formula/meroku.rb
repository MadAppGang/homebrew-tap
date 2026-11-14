class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "6.0.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.0.1/meroku_Darwin_x86_64.tar.gz"
      sha256 "30780ba272280d084f35770cf7c75058db98f98e92be7fbe033d09fd88560b81"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.0.1/meroku_Darwin_arm64.tar.gz"
      sha256 "072cbff43dc9f8a04b511f15ed2480c758682d50c34d3cf2ae9622742166d83c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.0.1/meroku_Linux_x86_64.tar.gz"
      sha256 "3939b9908000b3435319fc0a2b65acd8a654828dd59a94d524b987210ef73e0b"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.0.1/meroku_Linux_arm64.tar.gz"
      sha256 "dc63c71165fa18d9a4de6b8ec35b66904cb082b8d404841c63d70e2dbbc46f41"
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
