class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "4.5.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.5.0/meroku_Darwin_x86_64.tar.gz"
      sha256 "66ed6c29ece0c097a5414cca8ca1b785e0cd7ecb122fc18a4d6d60bd57b02404"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.5.0/meroku_Darwin_arm64.tar.gz"
      sha256 "c0121e257aae963c8d9a526d8f249c5df3129f2afd42e6b820826a5f18ce87c3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.5.0/meroku_Linux_x86_64.tar.gz"
      sha256 "42da41ce78f4f97b0d731ffba78979f435d419561589956e342a5f87e9beb185"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v4.5.0/meroku_Linux_arm64.tar.gz"
      sha256 "ae733f2b0610f29d21457954ad9f8a3430f8059e5c28d003243148394b234b73"
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
