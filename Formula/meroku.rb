class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "4.4.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.4.1/meroku_Darwin_x86_64.tar.gz"
      sha256 "0f2a28c012e0ef82549989399441e1bc580b1370c41999d15e7992539e7c5cac"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.4.1/meroku_Darwin_arm64.tar.gz"
      sha256 "69718b0b88887b42baa86da968807ea4441e393d5ccf62c006f03d2ff45db631"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.4.1/meroku_Linux_x86_64.tar.gz"
      sha256 "048769826f90d84905b848654bd1572969815898fec3478d3594c9bc369d629f"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.4.1/meroku_Linux_arm64.tar.gz"
      sha256 "133dcda9edd2b86ebae3080153e97fe6830ba825d6b3babbf768c92ad5514808"
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
