class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "3.22.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v3.22.1/meroku_Darwin_x86_64.tar.gz"
      sha256 "76eb3aa2a569a676114f97bf92a951ba699bb4d6d80cde5a8cea8338b5525570"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v3.22.1/meroku_Darwin_arm64.tar.gz"
      sha256 "853b35c363b9b9584456cb7c285e9b7725ff02e93dd380dbf1c78148eaf38fcc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v3.22.1/meroku_Linux_x86_64.tar.gz"
      sha256 "b079d2070ff778131e2ab26c05fa2bd3aae6c88974a7238012b897a921e6cc75"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v3.22.1/meroku_Linux_arm64.tar.gz"
      sha256 "8605bf6b955aa317f51888169d46c34ecbb76bf62c33524d3fd4539b99fbafd6"
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
