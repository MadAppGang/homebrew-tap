class Meroku < Formula
  desc "Easy infrastructure management"
  homepage "https://github.com/MadAppGang/meroku"
  version "5.7.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.7.0/meroku_Darwin_x86_64.tar.gz"
      sha256 "3d23b27e8fc0f7bdfbda49e539b60ea653e33324577a737423c9dbfaf81489b2"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.7.0/meroku_Darwin_arm64.tar.gz"
      sha256 "ebfce90ef7ee9d9b8069981077f5e3481fb8843e0362247b4edad582b955f154"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.7.0/meroku_Linux_x86_64.tar.gz"
      sha256 "c209c06d1d78df580ef6634ec32a9515f1301004f884b846ccc98f33e0eed4a5"
    end
    on_arm do
      url "https://github.com/MadAppGang/meroku/releases/download/v5.7.0/meroku_Linux_arm64.tar.gz"
      sha256 "0401924ab2c70535345235fc7353e31ce2176ec38632dcbef9034b79463b1941"
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
