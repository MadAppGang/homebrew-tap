class TmuxMcp < Formula
  desc "MCP server for agent-oriented tmux control with native process detection"
  homepage "https://github.com/MadAppGang/tmux-mcp"
  version "2.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v2.2.0/tmux-mcp_darwin_arm64.tar.gz"
      sha256 "9461c0afb09a77f773162b33b316f95372e5b1692bbc7fa741e22d81d12da8fb"
    end
    on_intel do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v2.2.0/tmux-mcp_darwin_amd64.tar.gz"
      sha256 "c4738d01339c05f6663b6df70140b0ebd5508a0fa672bea559113f8ae485aca7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v2.2.0/tmux-mcp_linux_arm64.tar.gz"
      sha256 "92c56c076bd7f32d9ea963b3d3122e435efa772cbed043c68ee933fe79ec1c71"
    end
    on_intel do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v2.2.0/tmux-mcp_linux_amd64.tar.gz"
      sha256 "bf1fdd12c969b47ee94357b00cb80a7a7e3564698f4d4c58fb85aea954c5cb3f"
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
