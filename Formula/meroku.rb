class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "4.4.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.4.0/meroku_Darwin_x86_64.tar.gz"
      sha256 "55d710bda719a884672300a8df7f0c0557e6bebb5b35240a7b91e8a6b9ee4678"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.4.0/meroku_Darwin_arm64.tar.gz"
      sha256 "3efe354fb64930e1654a72c9cdfe29218b4fbef365e4ec70ad00498bf4912b8a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.4.0/meroku_Linux_x86_64.tar.gz"
      sha256 "46e00826d94dd875e3961a00864471dfa69ef2202f990b2b866e41272e6711a0"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.4.0/meroku_Linux_arm64.tar.gz"
      sha256 "0613d31322a3585a29dec6166a73f27b44368b96d58a1cbe37dec10353c31b46"
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
