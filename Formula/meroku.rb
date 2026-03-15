class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://madappgang.com"
  version "3.21.45"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v3.21.45/meroku_Darwin_x86_64.tar.gz"
      sha256 "ed1beaf20319810cd5e55c75b97cfc0b09a50e703e43a4fd28a41f2ec0686da6"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v3.21.45/meroku_Darwin_arm64.tar.gz"
      sha256 "093998a42e87262a36ad5951a1ec3b89a6138b587ab31536650fbbfa766f4e28"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v3.21.45/meroku_Linux_x86_64.tar.gz"
      sha256 "31b2e56ca451b3024c9530480d2642595ef23a95d8e2b859ab14103d6276a2a2"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v3.21.45/meroku_Linux_arm64.tar.gz"
      sha256 "f36d19a65931f527219fc3f9e4969e74a1ad33803cea4db41125cf6d3726621d"
    end
  end

  depends_on "terraform" => :optional
  depends_on "opentofu" => :optional

  def install
    bin.install Dir["meroku*"].first => "meroku"
  end

  test do
    system "#{bin}/meroku", "--version"
  end
end
