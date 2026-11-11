class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "5.4.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.4.0/meroku_Darwin_x86_64.tar.gz"
      sha256 "d202d927ce5c2a06b9dd41d2f0fd6b7dabd1a62071d5a0dce2be6499b07d08c9"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.4.0/meroku_Darwin_arm64.tar.gz"
      sha256 "c6005147c8a1c5a155895ff2953b237388af12b70bbf7bbad10d9fa7d2349c83"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.4.0/meroku_Linux_x86_64.tar.gz"
      sha256 "369a3107e8d66de55322601efbffc0a285b3c1ae20df73089f4c9c864c7f7e69"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.4.0/meroku_Linux_arm64.tar.gz"
      sha256 "6f103cb73808ae292fdc32842c736c0e98c8f07628e126d92383ca8b534f9bfe"
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
