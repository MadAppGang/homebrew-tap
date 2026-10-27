class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "4.8.4"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.8.4/meroku_Darwin_x86_64.tar.gz"
      sha256 "4d5005ead02ad982c144f376aacf327353e428dd2459eb27833396b109a95a2d"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.8.4/meroku_Darwin_arm64.tar.gz"
      sha256 "7974efec07ef12d2befb65df9129930b27c6e112cff16e562039a24f6a4b0ed1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.8.4/meroku_Linux_x86_64.tar.gz"
      sha256 "cc13fc23ba6aec9b8c4d3d3088b37c9cd49cce628fdbf6e0cdc72835d7c802c2"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.8.4/meroku_Linux_arm64.tar.gz"
      sha256 "ab6e49128012e92aac69a60efe49c277a0eec8ceb99ce0ade77dadae37e5f84d"
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
