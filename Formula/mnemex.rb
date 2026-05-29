class Mnemex < Formula
  desc "Seven-layer code memory, benchmarked — AST-aware semantic code index"
  homepage "https://github.com/MadAppGang/mnemex"
  version "0.31.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MadAppGang/mnemex/releases/download/v0.31.2/mnemex-darwin-arm64"
      sha256 "95d18c1417e7151beedb775f24f817fc503b3034642ede6ae0e801d20d4b6543"
    end
    on_intel do
      url "https://github.com/MadAppGang/mnemex/releases/download/v0.31.2/mnemex-darwin-x64"
      sha256 "19362720b662724548b32f80f9e67fd92c01bd14faa80e08756553bf74df77de"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MadAppGang/mnemex/releases/download/v0.31.2/mnemex-linux-arm64"
      sha256 "32c5f71a3f3bf69f6635fd353b0d0752e492815a4e13ab436ef675b249d53a5e"
    end
    on_intel do
      url "https://github.com/MadAppGang/mnemex/releases/download/v0.31.2/mnemex-linux-x64"
      sha256 "3ea25121f8fb867b868bdf9f40407d4edb016edc8a3424bafbbe109d40b9bf4a"
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
