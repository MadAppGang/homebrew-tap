class TmuxMcp < Formula
  desc "MCP server for agent-oriented tmux control with native process detection"
  homepage "https://github.com/MadAppGang/tmux-mcp"
  version "2.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v2.0.0/tmux-mcp_darwin_arm64.tar.gz"
      sha256 "0a6d93021e0df8cbc915da68c0e2cdfb82f85075ce67c161fa786bceb4b275cd"
    end
    on_intel do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v2.0.0/tmux-mcp_darwin_amd64.tar.gz"
      sha256 "6e03b4c4d8f3fe70f18ebc1117afa91a82d120612e28586a16c7b0b6921a4522"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v2.0.0/tmux-mcp_linux_arm64.tar.gz"
      sha256 "10ca7af43fa0c83ae0e4e892171bad260a7055caee43507aa5b56f1a1a7e997f"
    end
    on_intel do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v2.0.0/tmux-mcp_linux_amd64.tar.gz"
      sha256 "44e8f5749e98230b87585b60131d2116ae00d8e8ceb57348a84b6c8dfd93cd20"
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
