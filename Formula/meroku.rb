class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "4.0.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.0.1/meroku_Darwin_x86_64.tar.gz"
      sha256 "4e0004d9df509049d1556bd8e3d2c86bcc9b7536110c3892c789c2c2bd28b0a7"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.0.1/meroku_Darwin_arm64.tar.gz"
      sha256 "7fab3b00c1d1afae03a635cf5a4660812bb237290599540614048f60c98ade9e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.0.1/meroku_Linux_x86_64.tar.gz"
      sha256 "2a163d228708b6120f304f5b0d53ce1a735502000e56d6e92187e2984002f944"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.0.1/meroku_Linux_arm64.tar.gz"
      sha256 "8d75d223194c709c388a4ff66cd195f4dbbd218f2b68fef2333e65f09e4bfe24"
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
