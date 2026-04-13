class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "3.23.4"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v3.23.4/meroku_Darwin_x86_64.tar.gz"
      sha256 "51ee903fbfc2e26d48b3def960f12f60b6a0a1c79591a1c86b1688a3dd0f2ef9"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v3.23.4/meroku_Darwin_arm64.tar.gz"
      sha256 "5d14461d8403a01d95919a5e6df33a2d918a54b3ba3c456c8a7c7384ee9dbfe1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v3.23.4/meroku_Linux_x86_64.tar.gz"
      sha256 "7f71896cfb3325ac532efa500c910ecc47639aa8796096d5e1253bad155a5c20"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v3.23.4/meroku_Linux_arm64.tar.gz"
      sha256 "bb4d1fed122885dcb7752ed77e3c1ce4d3b2f774a1b07b4896d82e6c1c611e55"
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
