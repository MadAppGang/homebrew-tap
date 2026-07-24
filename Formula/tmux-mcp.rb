class TmuxMcp < Formula
  desc "MCP server for agent-oriented tmux control with native process detection"
  homepage "https://github.com/MadAppGang/tmux-mcp"
  version "1.6.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.6.2/tmux-mcp_darwin_arm64.tar.gz"
      sha256 "2a4b0d13a561256e1771790f80d1fc2ce03030781ad64507081dd37eb0728f8a"
    end
    on_intel do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.6.2/tmux-mcp_darwin_amd64.tar.gz"
      sha256 "9b2f2d9dc800ff20b22012cd06c15dd582e3e54bf6b802d6d52836167fa0bd23"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.6.2/tmux-mcp_linux_arm64.tar.gz"
      sha256 "b32614a6544b12e9cd56b1abd355e2a738bc59df8b2730419d90c7b4d5f12313"
    end
    on_intel do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.6.2/tmux-mcp_linux_amd64.tar.gz"
      sha256 "3b35e312baa4efb04183a633fa3d5204f5461528b548afe765141d3765e9242a"
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
