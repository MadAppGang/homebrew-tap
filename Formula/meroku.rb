class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "3.23.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v3.23.3/meroku_Darwin_x86_64.tar.gz"
      sha256 "27657937ea6f45b48a270f9d4b3c034847a64f14af18bb59cba2b670bbb37f97"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v3.23.3/meroku_Darwin_arm64.tar.gz"
      sha256 "05e8d12bd116a7ade16733f6fa6e182851de3ebc7fe74308524f7381b16d18a1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v3.23.3/meroku_Linux_x86_64.tar.gz"
      sha256 "011a04c481a61cbc801cdde83b7016d922a3b9db4a62084f857889e1d4394d54"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v3.23.3/meroku_Linux_arm64.tar.gz"
      sha256 "de990a5e2c47e8b95eee8df7af37f27fac4c029e53ae3d4e3e6378fa1a9ca59d"
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
