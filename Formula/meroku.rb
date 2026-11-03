class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "4.11.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.11.0/meroku_Darwin_x86_64.tar.gz"
      sha256 "157afeb16a844f52d82b16e51f29dd718477a4aa0a2d126bc3f776598699654f"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.11.0/meroku_Darwin_arm64.tar.gz"
      sha256 "5188ba845dd6f5c745f79d7a54c09c47e57a96c010026b6c1ec388d704c202d9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.11.0/meroku_Linux_x86_64.tar.gz"
      sha256 "dda351efa89630a7c238bb87668547995d1613a4ff099f2560771530bbf0e310"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.11.0/meroku_Linux_arm64.tar.gz"
      sha256 "c410a369700891a43e71b8f77ad0328c64e305be0ecd7a13d0719adbf3f14255"
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
