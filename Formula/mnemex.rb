class Mnemex < Formula
  desc "Seven-layer code memory, benchmarked — AST-aware semantic code index"
  homepage "https://github.com/MadAppGang/mnemex"
  version "0.33.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MadAppGang/mnemex/releases/download/v0.33.0/mnemex-darwin-arm64"
      sha256 "cd99d72ca7060e8f1816b020dd3018ddc33496066ed35ba3ff4047f6a6ef4fd3"
    end
    on_intel do
      url "https://github.com/MadAppGang/mnemex/releases/download/v0.33.0/mnemex-darwin-x64"
      sha256 "76c8d839130e0df238ec44c84ffdd6c3919a95c8ce2a3278671b24b0e31b0710"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MadAppGang/mnemex/releases/download/v0.33.0/mnemex-linux-arm64"
      sha256 "2679c70758e301df4136d56d96f61ffd138b683d43391c17dc7b18f95a03e961"
    end
    on_intel do
      url "https://github.com/MadAppGang/mnemex/releases/download/v0.33.0/mnemex-linux-x64"
      sha256 "32bce3a0983c562286bce75dbf680a483d4a1e4414423d9d76910023d20136a0"
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
