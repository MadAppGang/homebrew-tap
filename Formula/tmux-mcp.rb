class TmuxMcp < Formula
  desc "MCP server for agent-oriented tmux control with native process detection"
  homepage "https://github.com/MadAppGang/tmux-mcp"
  version "1.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.6.1/tmux-mcp_darwin_arm64.tar.gz"
      sha256 "384efe9896b2f0ae705e2c4f54b533e32a33934f46ce62b46bcce49408bb083d"
    end
    on_intel do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.6.1/tmux-mcp_darwin_amd64.tar.gz"
      sha256 "570a454a69747c24c13fdd603ddfff9660a46baa977196d3bc68b724b447647f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.6.1/tmux-mcp_linux_arm64.tar.gz"
      sha256 "4cb5298069cde400ce60321797ed9d7bec29778d9a963bfd935ae9ec18dac776"
    end
    on_intel do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.6.1/tmux-mcp_linux_amd64.tar.gz"
      sha256 "9876d0052faea3388e671222d9ca9554c71304122bd8176dc297f1b752ad16eb"
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
