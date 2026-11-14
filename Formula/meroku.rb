class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "6.0.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.0.3/meroku_Darwin_x86_64.tar.gz"
      sha256 "92fc18362b93f6382f30be10303a79692c072a911ff2c75df02b3b42bc546f0e"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.0.3/meroku_Darwin_arm64.tar.gz"
      sha256 "81f67522a6aeee7be0c81b26e25e8fb287ef1d318716595593ef2f37d3df5930"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.0.3/meroku_Linux_x86_64.tar.gz"
      sha256 "72db4aae654a86b6d67ab51e70be6168077219872c118a2877a3398885bc38c6"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.0.3/meroku_Linux_arm64.tar.gz"
      sha256 "0c30966846d722c54fda2b9cdd9944a8ddb13728846a35fa1c242b8e3b3e522c"
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
