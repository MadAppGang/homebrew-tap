class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "5.0.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.0.0/meroku_Darwin_x86_64.tar.gz"
      sha256 "af43277967294297620973540a141c8f43f98e2d9b5aebe6feaf003a030a73f2"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.0.0/meroku_Darwin_arm64.tar.gz"
      sha256 "9ae2d16181faffdbf3fae27dd6806e6c1d4681ac9186f8b7654bcb91565ca95f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.0.0/meroku_Linux_x86_64.tar.gz"
      sha256 "b94125dd107b4281df701220f9415cc40bcaa81dc8d73f2214b5c38c05000eda"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.0.0/meroku_Linux_arm64.tar.gz"
      sha256 "714b092c9ab87d0b0d130380c81e290256135dd33358a0b07574f7b27174875d"
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
