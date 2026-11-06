class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "4.13.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.13.0/meroku_Darwin_x86_64.tar.gz"
      sha256 "7261776e9356d6c7d593c51ee512caf3addb3391bb5d374b26a4e203c577a0bd"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.13.0/meroku_Darwin_arm64.tar.gz"
      sha256 "3a182053c28e7200ceceb7ecf60dab7f41ffa84f102b0841f51001d2d05a30af"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.13.0/meroku_Linux_x86_64.tar.gz"
      sha256 "6af6624543a8566023360bdb1825dbb3446d44da15f7e271f95265a9a2b833ca"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.13.0/meroku_Linux_arm64.tar.gz"
      sha256 "5f943d0d6725f51e2bba039a63c476a90af2d9d0f8fb58ad4445d94a60168bbb"
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
