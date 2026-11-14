class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "6.1.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.1.0/meroku_Darwin_x86_64.tar.gz"
      sha256 "a844a1479b9ab002d96e76d5e65a902852ba9bdae77128d4b56a0f793b166dbe"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.1.0/meroku_Darwin_arm64.tar.gz"
      sha256 "9287b6aab43c676bc53e7905f5e9a9546e7568d0c65801d533576cf5e779993f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.1.0/meroku_Linux_x86_64.tar.gz"
      sha256 "5c33b0fe5a44da43a8140fc259a379cf9963fba8b20466a2ade16a4298a4e687"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.1.0/meroku_Linux_arm64.tar.gz"
      sha256 "3e874b5c4663e70fa3858331ff8c4dc9f7f3ec4202584651e9b2ba96ca3179b1"
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
