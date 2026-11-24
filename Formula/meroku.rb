class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "6.12.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.12.0/meroku_Darwin_x86_64.tar.gz"
      sha256 "7814a2232555871591592ae6eb0d951e0a47aef3f27ba3586c31d13f5fc68344"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.12.0/meroku_Darwin_arm64.tar.gz"
      sha256 "e9216ac32c3a505a930bc35cbaea344906e00a0306b629163dfd8a7af90a6bc4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.12.0/meroku_Linux_x86_64.tar.gz"
      sha256 "69ca075fcddb3bd23d3254501264a8de526a04cbe92b123970e8c2f6e9e4febe"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v6.12.0/meroku_Linux_arm64.tar.gz"
      sha256 "23d3e00a8f116e5e2ab5bdb62d8d559832730b93a9b2a081ab976101cf6cdded"
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
