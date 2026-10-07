class Mnemex < Formula
  desc "Seven-layer code memory, benchmarked — AST-aware semantic code index"
  homepage "https://github.com/MadAppGang/mnemex"
  version "0.36.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MadAppGang/mnemex/releases/download/v0.36.2/mnemex-darwin-arm64"
      sha256 "d3a1b6bec5034d1d7222955945b62b7d7c50303e3a07918c66099b4b83aa0fd4"
    end
    on_intel do
      url "https://github.com/MadAppGang/mnemex/releases/download/v0.36.2/mnemex-darwin-x64"
      sha256 "72dba8703bc928ebf00e0f63550c3a183ee2eb6ad8e1b11f53bc1eae56e8000e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MadAppGang/mnemex/releases/download/v0.36.2/mnemex-linux-arm64"
      sha256 "e24343f79c3b750d4f57e0779bd9f58e3414dc94f1d4b40b800dc974908ff30c"
    end
    on_intel do
      url "https://github.com/MadAppGang/mnemex/releases/download/v0.36.2/mnemex-linux-x64"
      sha256 "b2a8ad217a0760a8f90e7c9e140c8e40ae4fa757f058f96e8b7f0d0e02810057"
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
