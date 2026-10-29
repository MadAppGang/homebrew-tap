class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "4.8.5"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.8.5/meroku_Darwin_x86_64.tar.gz"
      sha256 "02d7e4fa0ed0e3e98d8e7235f982fc293d176b9f91496eae792e0d64877452f8"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.8.5/meroku_Darwin_arm64.tar.gz"
      sha256 "cc24ba452e5722fad3e46fdbd685a49ec2193c34110c528921d91eddaf7af60d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.8.5/meroku_Linux_x86_64.tar.gz"
      sha256 "d278735ca626f906e1565c1467482017d75b2495da8117852dabd3027ff5d7f0"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.8.5/meroku_Linux_arm64.tar.gz"
      sha256 "4723057f3cd6d4f393b1149ff472c32637e9a01cffbdad2ac6471b6966d2ebbf"
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
