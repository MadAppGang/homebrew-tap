class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "5.3.5"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.3.5/meroku_Darwin_x86_64.tar.gz"
      sha256 "4c9e045c79dc520f53a34427592dfa4deca0049d01f1241e5c37836ad78e4418"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.3.5/meroku_Darwin_arm64.tar.gz"
      sha256 "a861cb11df1c66bbf50819fdc30edaf3271b5d6264c0fcfc0667cbe53d17f048"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.3.5/meroku_Linux_x86_64.tar.gz"
      sha256 "ee799694ceb6c5a2b27a037ed33400359c11ec4e72051b8df4495484a2194bdf"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.3.5/meroku_Linux_arm64.tar.gz"
      sha256 "686218537ecd7030e98bd166fe45eb96f78291c858b5e7acac378d1236eb43c6"
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
