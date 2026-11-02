class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "4.10.4"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.10.4/meroku_Darwin_x86_64.tar.gz"
      sha256 "7f5e2c47211556b30182e1c06abd12c93b1dc6d792c8babf3010483d6c9f56d6"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.10.4/meroku_Darwin_arm64.tar.gz"
      sha256 "a23308bb4a22b277d204a1a81c76ddbe4482723de6daa652c353272f0d0093df"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.10.4/meroku_Linux_x86_64.tar.gz"
      sha256 "6ff9e12e72e120e450341fd04b44d144ff91e0d6867b2cbf917c32dc624f89ab"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.10.4/meroku_Linux_arm64.tar.gz"
      sha256 "f758aae52667f1ecfbdc4a203426ff31025470de65919449c45869c7d5328ef0"
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
