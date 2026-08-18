class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "4.1.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.1.0/meroku_Darwin_x86_64.tar.gz"
      sha256 "695d1e874fc53ee8bd90540a1eea119b213904fcf4b61432034285fadf3ea844"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.1.0/meroku_Darwin_arm64.tar.gz"
      sha256 "269b28287ce5bea536fd49724500edc208383244cfc658bf43268ddce0e0b742"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.1.0/meroku_Linux_x86_64.tar.gz"
      sha256 "eb71e50d2f2edf52fb8711e6145b05349ba76d84ed149dac397f16cf7c49ef9a"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.1.0/meroku_Linux_arm64.tar.gz"
      sha256 "b3b979fc75c07f3750fd349236372d247ac3007c6d0db6384327722416d91a12"
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
