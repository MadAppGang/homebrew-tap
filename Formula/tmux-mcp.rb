class TmuxMcp < Formula
  desc "MCP server for agent-oriented tmux control with native process detection"
  homepage "https://github.com/MadAppGang/tmux-mcp"
  version "2.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v2.1.1/tmux-mcp_darwin_arm64.tar.gz"
      sha256 "76a72df79cbade4b29fac6ca3b673b289c7966b418c8b17ed8c94f9970c433f9"
    end
    on_intel do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v2.1.1/tmux-mcp_darwin_amd64.tar.gz"
      sha256 "5f15213dba6d2938aa2b0dd06136afe1724be828e63651943711de952a2a6619"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v2.1.1/tmux-mcp_linux_arm64.tar.gz"
      sha256 "fba7cd094e74cc2bd4004bf5ae0e570c86f05438fa3c22a06d531ec4571049aa"
    end
    on_intel do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v2.1.1/tmux-mcp_linux_amd64.tar.gz"
      sha256 "bf8952d5835288f9496fa191d94cb9ff035d8b61d37ea09017286d48805dabef"
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
