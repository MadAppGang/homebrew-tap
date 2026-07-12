class TmuxMcp < Formula
  desc "MCP server for agent-oriented tmux control with native process detection"
  homepage "https://github.com/MadAppGang/tmux-mcp"
  version "1.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.6.0/tmux-mcp_darwin_arm64.tar.gz"
      sha256 "0e9c9d24400b8aeefe6973353d352d85f6cbfe88ac591c0f4505c02c7d97a423"
    end
    on_intel do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.6.0/tmux-mcp_darwin_amd64.tar.gz"
      sha256 "f49b2d02db76a8a4babff6efab7a92761525c6b95e2a32faf3a198fa42d7f7d5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.6.0/tmux-mcp_linux_arm64.tar.gz"
      sha256 "2cdc35774f715bd16b0bbf6142a959e6ad8251794b2a9ddcf91bbfd7702fb46c"
    end
    on_intel do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.6.0/tmux-mcp_linux_amd64.tar.gz"
      sha256 "0e897a9bb5af6ae12e29993a5ff24b3ccb7b2bf2af5562e76cd30c057f3fc27f"
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
