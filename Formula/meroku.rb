class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "5.4.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.4.2/meroku_Darwin_x86_64.tar.gz"
      sha256 "8eeeb11c08d6ad1f400345a7fa051b6f7807f22b36a6c25d99ae4becd5719056"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.4.2/meroku_Darwin_arm64.tar.gz"
      sha256 "870c4d683c0ec75bc338bb7e4aaab3621f08b32f72f3aa850848ff9dd48ca873"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.4.2/meroku_Linux_x86_64.tar.gz"
      sha256 "89e4505362c8ccac4a8ff7eed6440efa2dc7682973cdce805744468f914f75d7"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.4.2/meroku_Linux_arm64.tar.gz"
      sha256 "3243fede4197674a7d54c48bac26c617484ba3e16953023ca8f6e8115f691936"
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
