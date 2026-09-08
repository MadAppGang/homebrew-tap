class Mnemex < Formula
  desc "Seven-layer code memory, benchmarked — AST-aware semantic code index"
  homepage "https://github.com/MadAppGang/mnemex"
  version "0.35.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MadAppGang/mnemex/releases/download/v0.35.0/mnemex-darwin-arm64"
      sha256 "b7d31c923d72f80104483936409c1c07b13c11d8056ad1356cd13417b1fcd94b"
    end
    on_intel do
      url "https://github.com/MadAppGang/mnemex/releases/download/v0.35.0/mnemex-darwin-x64"
      sha256 "1c0c7034dd501063442c870972a77e7697c3cc339286803859f1d208600443ed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MadAppGang/mnemex/releases/download/v0.35.0/mnemex-linux-arm64"
      sha256 "6029c71bc9773f08a8f87b6d5a5ba06cd6c4fc6346e1ba9bac136296b19e9486"
    end
    on_intel do
      url "https://github.com/MadAppGang/mnemex/releases/download/v0.35.0/mnemex-linux-x64"
      sha256 "50d918d17dfb0982c52306daa2e2c3deb31094ae39ce3f8eab238c6124b39805"
    end
  end

  def install
    os_tag = OS.mac? ? "darwin" : "linux"
    arch_tag = Hardware::CPU.arm? ? "arm64" : "x64"
    bin.install "mnemex-#{os_tag}-#{arch_tag}" => "mnemex"
  end

  test do
    assert_match "mnemex", shell_output("#{bin}/mnemex --version")
  end
end
