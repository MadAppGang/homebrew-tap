class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "6.7.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.7.0/meroku_Darwin_x86_64.tar.gz"
      sha256 "5bb020d0837f23a6f3089920566a6c666f46c951f16821d1f757c85f52a39208"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.7.0/meroku_Darwin_arm64.tar.gz"
      sha256 "b519316cf70b4c774ac8109093a2fb49f31e6f2e7b41668f6fd5b3b1da39fe8d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.7.0/meroku_Linux_x86_64.tar.gz"
      sha256 "4d6366423683ee216faa420ebb56142033bca7eb319e53da24e938775a6c211a"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.7.0/meroku_Linux_arm64.tar.gz"
      sha256 "fa49bb7f4cf79eca4ef157ac7ca06cd1e7a4749153cfd4122a6a4c26703d7145"
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
