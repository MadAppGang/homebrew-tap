class Mnemex < Formula
  desc "Seven-layer code memory, benchmarked — AST-aware semantic code index"
  homepage "https://github.com/MadAppGang/mnemex"
  version "0.31.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MadAppGang/mnemex/releases/download/v0.31.0/mnemex-darwin-arm64"
      sha256 "b2828637eccef0aa7ab14cd9c84c99cea8f69ca3c1012be2234ff606e68ef0b4"
    end
    on_intel do
      url "https://github.com/MadAppGang/mnemex/releases/download/v0.31.0/mnemex-darwin-x64"
      sha256 "ae15709438043ea2148b86252d6dea1db3085374203d1c993cca7467f7eefb7b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MadAppGang/mnemex/releases/download/v0.31.0/mnemex-linux-arm64"
      sha256 "9d4dc010e27e4bc78102755e7a5c1e8a83e941d55891fec7be1f9a5157b32294"
    end
    on_intel do
      url "https://github.com/MadAppGang/mnemex/releases/download/v0.31.0/mnemex-linux-x64"
      sha256 "304e28614cb70b11333a3d6d4f63ce63144204fb6adfce518a6797c1f469b8b3"
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
