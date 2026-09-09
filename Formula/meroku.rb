class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "4.8.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.8.1/meroku_Darwin_x86_64.tar.gz"
      sha256 "235389a5c2403937b9ba0e650a3309984bc0446e4d97e1cf0ec5a5c82c4c1703"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.8.1/meroku_Darwin_arm64.tar.gz"
      sha256 "369404f21c4a65f29d1777cc9df4d2466498d30ba43f50d9bebf5ad82be8653c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.8.1/meroku_Linux_x86_64.tar.gz"
      sha256 "9e5023cf680ca5f116faea8d917555207f44fddc47274dd7a2d6b077c3ce3cba"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.8.1/meroku_Linux_arm64.tar.gz"
      sha256 "e80960e86552fd6e8c642d6f14b521a0c9f5bf0a58888cbf434a97be843510f8"
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
