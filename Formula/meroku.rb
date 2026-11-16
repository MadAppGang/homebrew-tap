class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "6.4.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.4.0/meroku_Darwin_x86_64.tar.gz"
      sha256 "2b37465ce6b06bf30b7fa1dc64e086268bd26ceed26bac0e0e6c217e4f046675"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.4.0/meroku_Darwin_arm64.tar.gz"
      sha256 "d93677de41523892438e7d17cc4b65a22a9a03b2227712ff3649b2a063c8a160"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.4.0/meroku_Linux_x86_64.tar.gz"
      sha256 "88a7e5d6cd393db89dc6fc9c2ab83abec3c7f8ec5d06f1c50505ace19cdfc400"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.4.0/meroku_Linux_arm64.tar.gz"
      sha256 "ab9d45a97075c92326ad26e5932e34f22db0987034d9a91fec229e8849ed8612"
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
