class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "4.9.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.9.0/meroku_Darwin_x86_64.tar.gz"
      sha256 "8af131ea2e5585c806535f8894412ab28fe7aa2e7c91a1dd0de43eaab3439e66"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.9.0/meroku_Darwin_arm64.tar.gz"
      sha256 "ea0d55ab0669df5a65233c100b2a644887584e6481b6029d507acfdcd2e80576"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.9.0/meroku_Linux_x86_64.tar.gz"
      sha256 "8978c4420cd04525f067f5978e2183a65b709c244578b47c4bbc08aaad99e1c3"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.9.0/meroku_Linux_arm64.tar.gz"
      sha256 "a8ee07dd57f65fe643c01ef91c6d36bfbdfc674b9d799e0fbdedfffb48fea636"
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
