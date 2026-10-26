class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "4.8.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.8.3/meroku_Darwin_x86_64.tar.gz"
      sha256 "71d0ed9e9714ab36e2ee38a76efd526e03660e0093a5c26f7a0bf61461c99814"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.8.3/meroku_Darwin_arm64.tar.gz"
      sha256 "30524fa6dcf78fc49a22a1d56850434d99983cf612d3f0801c5db05745a9c1aa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.8.3/meroku_Linux_x86_64.tar.gz"
      sha256 "ec6d4fa37dbdf4964365cf95eed3b07a0fbad516b6bf7ca74727f47d91081502"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.8.3/meroku_Linux_arm64.tar.gz"
      sha256 "687f3f81880a5a475e8674ae12da80f0c9a685edb627d4eee1e33a8bf49885d9"
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
