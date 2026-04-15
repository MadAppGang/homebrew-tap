class Mnemex < Formula
  desc "Seven-layer code memory, benchmarked — AST-aware semantic code index"
  homepage "https://github.com/MadAppGang/mnemex"
  version "0.30.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MadAppGang/mnemex/releases/download/v0.30.0/mnemex-darwin-arm64"
      sha256 "84cb18f301ff84589f67346cde92708e2b8a62005ffbb9a13e6a3bf6c0f29c88"
    end
    on_intel do
      url "https://github.com/MadAppGang/mnemex/releases/download/v0.30.0/mnemex-darwin-x64"
      sha256 "6f44d332d44a547a7bcd4f6219d8988ceb8a68575d44c2a8c35259e25e59f49d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MadAppGang/mnemex/releases/download/v0.30.0/mnemex-linux-arm64"
      sha256 "48d9dc6f79a9842962e069a953939709266e7bd28bc982f35011ebdeb0088312"
    end
    on_intel do
      url "https://github.com/MadAppGang/mnemex/releases/download/v0.30.0/mnemex-linux-x64"
      sha256 "e9542cf9686f29cf1bfa05e54556cfbc0d2a4d7650cf8f07a6481e1bf439f8c6"
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
