class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "6.8.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.8.0/meroku_Darwin_x86_64.tar.gz"
      sha256 "bf4eedb6015d97ca32f5fd456e3114d13c40168362fcb67d87922e7c16d3dbb0"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.8.0/meroku_Darwin_arm64.tar.gz"
      sha256 "4bbc3467917a493f811b2108c7e720b6e596227f74b153d4d78593c9124c5c71"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.8.0/meroku_Linux_x86_64.tar.gz"
      sha256 "004df8f69dd4b7354803dcc9a05fea07af0afa0e9e2813d8e2e539511562d965"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.8.0/meroku_Linux_arm64.tar.gz"
      sha256 "90bbef224fd93568e994a1276ac312a48484b64d5544d5902957fa8087669775"
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
