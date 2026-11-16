class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "6.5.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.5.0/meroku_Darwin_x86_64.tar.gz"
      sha256 "1cdca2fa31060a29521276c14bd512ae924d71f2836f67177ab202f9e4468028"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.5.0/meroku_Darwin_arm64.tar.gz"
      sha256 "f1620731db3658ece7f917ae6ae00810c130cdcee5c032e293e9d9c0ab904e2d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.5.0/meroku_Linux_x86_64.tar.gz"
      sha256 "aea02c0e84271baa41d3595fd4818bd88e11d88978c3215517d12d95c585ce1b"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.5.0/meroku_Linux_arm64.tar.gz"
      sha256 "d45a6022cc242a4550bad6d3ff8dbb085c6f34c8e2d2b70aa8d43b7ce349dfbf"
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
