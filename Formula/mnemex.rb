class Mnemex < Formula
  desc "Seven-layer code memory, benchmarked — AST-aware semantic code index"
  homepage "https://github.com/MadAppGang/mnemex"
  version "0.36.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MadAppGang/mnemex/releases/download/v0.36.0/mnemex-darwin-arm64"
      sha256 "1176264d818631f94e31f9d07ce312a1e1fedb04b14a7b3da01365677de6dd53"
    end
    on_intel do
      url "https://github.com/MadAppGang/mnemex/releases/download/v0.36.0/mnemex-darwin-x64"
      sha256 "00c07e70512229f9a27d593cfd6dc8e93d4af2ff495ad59cafc62ca5d14831de"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MadAppGang/mnemex/releases/download/v0.36.0/mnemex-linux-arm64"
      sha256 "cb9e44b940adaa185f6058ed15a2c72b62630f6a210ac0a6a14d657ef4e7a355"
    end
    on_intel do
      url "https://github.com/MadAppGang/mnemex/releases/download/v0.36.0/mnemex-linux-x64"
      sha256 "df8371856ace4af69f658ebe13c4c1779ff96d5313dc5961a52f4257e88ac6e3"
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
