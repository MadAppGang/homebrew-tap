class Mnemex < Formula
  desc "Seven-layer code memory, benchmarked — AST-aware semantic code index"
  homepage "https://github.com/MadAppGang/mnemex"
  version "0.34.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MadAppGang/mnemex/releases/download/v0.34.0/mnemex-darwin-arm64"
      sha256 "3aaf4886fd8c6c8b49923b8de52ff55bec9aa8d4a03a3c50fff3610dd2bc104b"
    end
    on_intel do
      url "https://github.com/MadAppGang/mnemex/releases/download/v0.34.0/mnemex-darwin-x64"
      sha256 "9189e2ad5e3adb409393441449b0c8647eba6f150901b910ee36aa5e1887ff9f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MadAppGang/mnemex/releases/download/v0.34.0/mnemex-linux-arm64"
      sha256 "73477a95a0c488a038332cf5b459f390fef4f7bb6a0ef094678125563a9c2989"
    end
    on_intel do
      url "https://github.com/MadAppGang/mnemex/releases/download/v0.34.0/mnemex-linux-x64"
      sha256 "96e1a8958590e42d775d89ebecd4eb5187fc9cf0b458b763c520df2fcee34766"
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
