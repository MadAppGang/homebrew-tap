class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "6.0.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.0.2/meroku_Darwin_x86_64.tar.gz"
      sha256 "e85d6de068cd3e511da46e15cdc86963751be3db952da3a7af94dce67d187f51"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.0.2/meroku_Darwin_arm64.tar.gz"
      sha256 "fa9b7d2627d29e4f1c506948f7f47045dc603c800077495e34a5f306d00cf09d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.0.2/meroku_Linux_x86_64.tar.gz"
      sha256 "9fa5779f82d1ce47ed716821a9c1b811a19670358f138855f972da50b2012880"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.0.2/meroku_Linux_arm64.tar.gz"
      sha256 "64c3f482fd3637f4a7a3f26af5183ffad3a35b3ddbfe21d3650dc4310ef454ac"
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
