class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "6.2.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.2.0/meroku_Darwin_x86_64.tar.gz"
      sha256 "bf77aaa18d31320e49d803ec2e7b125da346e175a5c62377d8c91093d1181431"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.2.0/meroku_Darwin_arm64.tar.gz"
      sha256 "4be06cf47d8c2a0167bfe73ce21cf54d38ef5ef8ad0211d0310638d51afbc266"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.2.0/meroku_Linux_x86_64.tar.gz"
      sha256 "c755cc20f63c6762dbc0e7833220b707822a6c33847c80510c1cad7791026001"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.2.0/meroku_Linux_arm64.tar.gz"
      sha256 "9203a86840cbb12810dca5413f15cc84cc8114d6cfcfa3a96803abf9f74de449"
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
