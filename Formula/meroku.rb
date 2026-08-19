class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "4.2.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.2.0/meroku_Darwin_x86_64.tar.gz"
      sha256 "514687331cd8b5fe650b99b04f3f28961237e09e02b3f5bba364146e3cb7e08f"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.2.0/meroku_Darwin_arm64.tar.gz"
      sha256 "bd7fe9c4d3b22aa5a55d647b16c6f8266df8412e54d52026ca1f0fc08245627a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.2.0/meroku_Linux_x86_64.tar.gz"
      sha256 "64ddcaaf941901735b6847081dc078b92a1a180a5dc01523f2ca54a1a7f75ee3"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.2.0/meroku_Linux_arm64.tar.gz"
      sha256 "a9e608724a480d5df789c62c86bb6e986bef5204b19bb2ce4b225a65b7904f67"
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
