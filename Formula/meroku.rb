class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "4.10.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.10.2/meroku_Darwin_x86_64.tar.gz"
      sha256 "59043843e56e70d2bccfc761256856ac5e53706da2b9c9e2656bc9145393a551"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.10.2/meroku_Darwin_arm64.tar.gz"
      sha256 "20e4a12b80962d3068a485d6ec0a72543e94388d4839221f2abd3c32731b37f9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.10.2/meroku_Linux_x86_64.tar.gz"
      sha256 "d68f3d63f3b7917a130f6830f1a5f7bd49da66f2ef734dee6555cfa03c0248d1"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.10.2/meroku_Linux_arm64.tar.gz"
      sha256 "1715b7bb8425f01021e67b2e048e330a1bbb4df369f2c72a10d2f4a36175411b"
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
