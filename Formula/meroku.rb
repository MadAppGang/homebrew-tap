class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "4.11.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.11.1/meroku_Darwin_x86_64.tar.gz"
      sha256 "dc82431d01722f42833f0171da67666322bf777918db66f56c45820852a92114"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.11.1/meroku_Darwin_arm64.tar.gz"
      sha256 "ab2592963b6bed0d0f769ed89ea502d21f752056a0dbc34724f3a41dab39de34"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.11.1/meroku_Linux_x86_64.tar.gz"
      sha256 "843453cd05a0ab159c76502c3e1f19bf9b546d6a6db89d6572af311bd0ebe563"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.11.1/meroku_Linux_arm64.tar.gz"
      sha256 "ecfbf366718a32f5de5b956e3ce21d5ce867b9f85740329e90c93e0b93348720"
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
