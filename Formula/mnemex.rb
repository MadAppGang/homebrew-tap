class Mnemex < Formula
  desc "Seven-layer code memory, benchmarked — AST-aware semantic code index"
  homepage "https://github.com/MadAppGang/mnemex"
  version "0.36.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MadAppGang/mnemex/releases/download/v0.36.1/mnemex-darwin-arm64"
      sha256 "d36b0648f5cf7bb92bce2bc63ade0b7fd4ff6dc9dec7f7ac7b5c43a41c683d1e"
    end
    on_intel do
      url "https://github.com/MadAppGang/mnemex/releases/download/v0.36.1/mnemex-darwin-x64"
      sha256 "b833b0d3d11d5969417c6621a0cfd96a98c3b4c68ddcc576cdc164b4a507ea89"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MadAppGang/mnemex/releases/download/v0.36.1/mnemex-linux-arm64"
      sha256 "855ef3586adcec3192d77ca3a3f8253abe4e17df847293a025beb19c342fc0f3"
    end
    on_intel do
      url "https://github.com/MadAppGang/mnemex/releases/download/v0.36.1/mnemex-linux-x64"
      sha256 "52824b20f7334ca41382e68d6424781f1f4958c453d3ca1abbddd67b9df4df51"
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
