class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "6.6.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.6.0/meroku_Darwin_x86_64.tar.gz"
      sha256 "23e0bcf95dfc2fea0cee412555c00f1d9b8c39cfc8721ecb1a889f8e345db6af"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.6.0/meroku_Darwin_arm64.tar.gz"
      sha256 "8f6a8ec7bff91f506a04847047b4ddbf415fd67e94103160fe6752eb74544265"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.6.0/meroku_Linux_x86_64.tar.gz"
      sha256 "1b9f68a838229211be08938205efc03796da3753372bd5346930ce5261eae532"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.6.0/meroku_Linux_arm64.tar.gz"
      sha256 "60a17fec5b003c588ec6c4568a45812d9715d7472bf1939aa55ec0c613b455c3"
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
