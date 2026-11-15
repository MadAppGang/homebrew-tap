class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "6.3.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.3.1/meroku_Darwin_x86_64.tar.gz"
      sha256 "f61ffe68189f57246da950864193d48d8f68217162893cff59e041fb70025a6e"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.3.1/meroku_Darwin_arm64.tar.gz"
      sha256 "0cb068db807aa81934dfda17d77e706c277b7240414ca505128e75cf965cfcd6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.3.1/meroku_Linux_x86_64.tar.gz"
      sha256 "19cb83b4f66220768c957400533df020618f36094511d40422158f4fa43f0c2b"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.3.1/meroku_Linux_arm64.tar.gz"
      sha256 "e35367e11b73c02393901400916bd45e62d6e548b8facd9e52ca0baea7f86d54"
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
