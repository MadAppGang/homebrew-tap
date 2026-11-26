class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "6.13.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.13.0/meroku_Darwin_x86_64.tar.gz"
      sha256 "fb1ecbbb6347bbaf2f2221d8be434fbef832892a51a76d8dc10666ad814ae2b0"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.13.0/meroku_Darwin_arm64.tar.gz"
      sha256 "7bb2ce2ae34d519cef4bd43422ce4eeaa27a5b694f58ff6c624e173efc4c4b28"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.13.0/meroku_Linux_x86_64.tar.gz"
      sha256 "8dda4103935681bfc28c839f6b0cce3319bf4b370e5efaf342ceac9126177073"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.13.0/meroku_Linux_arm64.tar.gz"
      sha256 "7db605ade50c60c0ef9c53d0189ec6fc2602a3b2c490791ec40e3e934322c000"
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
