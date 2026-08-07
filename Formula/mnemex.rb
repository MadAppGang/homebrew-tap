class Mnemex < Formula
  desc "Seven-layer code memory, benchmarked — AST-aware semantic code index"
  homepage "https://github.com/MadAppGang/mnemex"
  version "0.32.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MadAppGang/mnemex/releases/download/v0.32.0/mnemex-darwin-arm64"
      sha256 "30d347cc15a57f4997153d2688450552f6999088ddfd021cc7e61e13b395f403"
    end
    on_intel do
      url "https://github.com/MadAppGang/mnemex/releases/download/v0.32.0/mnemex-darwin-x64"
      sha256 "01a03b1fcca4c4930682e8bece34fe94bbe98a426e0d93ef27c53cb90711d14b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MadAppGang/mnemex/releases/download/v0.32.0/mnemex-linux-arm64"
      sha256 "82ad2ef38f00f7d3a479a24b9e64e319acfddd0ed9fd412bcf282dd0b218d4aa"
    end
    on_intel do
      url "https://github.com/MadAppGang/mnemex/releases/download/v0.32.0/mnemex-linux-x64"
      sha256 "47b3534049e2e231e637752c6f9915d881cae2924bae991973e3c645e0c9cd02"
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
