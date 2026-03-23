class TmuxMcp < Formula
  desc "MCP server for agent-oriented tmux control with native process detection"
  homepage "https://github.com/MadAppGang/tmux-mcp"
  version "1.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.1.0/tmux-mcp_darwin_arm64.tar.gz"
      sha256 "0247b7035eb1869f84bc28dc7f9db3911714d16b1e0a61b45303044e38eff7a7"
    end
    on_intel do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.1.0/tmux-mcp_darwin_amd64.tar.gz"
      sha256 "a5e650530af5bbb0f465c5d5ded480723bcdbb896d90f0007629d4599fbc09b8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.1.0/tmux-mcp_linux_arm64.tar.gz"
      sha256 "bfede15ab4b69452ad8f6e79ef046a06ec6b021dc3b900312c2d6bfcf2a1e957"
    end
    on_intel do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.1.0/tmux-mcp_linux_amd64.tar.gz"
      sha256 "98f40372118e8da26c9e33dc096de6568679ff63db91104b329e34dee997ed3f"
    end
  end

  depends_on "tmux"

  def install
    bin.install "tmux-mcp"
  end

  test do
    assert_match "tmux-mcp", shell_output("#{bin}/tmux-mcp --help 2>&1", 2)
  end
end
