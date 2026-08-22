class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "4.3.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.3.1/meroku_Darwin_x86_64.tar.gz"
      sha256 "3d5a657da92d768d6f11e6385cc64cf575c0b721894119f858ee8f1521bacec0"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.3.1/meroku_Darwin_arm64.tar.gz"
      sha256 "5d5fcd3e4b1f4ce74920bb6a4055d9458851b86dcbc30e5eb49e08786cf68240"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.3.1/meroku_Linux_x86_64.tar.gz"
      sha256 "db789bff186ed2f8aafb7fb7256477e5987536b03e503efa0966c9fe53ae77a1"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.3.1/meroku_Linux_arm64.tar.gz"
      sha256 "33ee8bb1fe9be860219478d7ca35120008ab14c93e87595b7253fb87fa475f86"
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
