class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "6.10.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.10.0/meroku_Darwin_x86_64.tar.gz"
      sha256 "85ae671a5bd17ad71bf106db26309d11570a901ed6830f10ac90eeabd469d366"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.10.0/meroku_Darwin_arm64.tar.gz"
      sha256 "12ccccf83f54e51f8a4b3c57b604cb49902759673c4dca36668efd98c4bcd72c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.10.0/meroku_Linux_x86_64.tar.gz"
      sha256 "ce1adaf8059148a5c93bbb007e8f8e1d4799bdc6d6243e7564d337f61bccd115"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.10.0/meroku_Linux_arm64.tar.gz"
      sha256 "bc300b1b60435e279fb4839d026e1977ec03febc15c9c8b553eb208ef7d2ebdb"
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
