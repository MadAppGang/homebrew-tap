class TmuxMcp < Formula
  desc "MCP server for agent-oriented tmux control with native process detection"
  homepage "https://github.com/MadAppGang/tmux-mcp"
  version "1.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.4.0/tmux-mcp_darwin_arm64.tar.gz"
      sha256 "e21f4e5a9ad8d5954487dab2c9f49f75977f6d8259a7600a8ebfdd43c9b4edc5"
    end
    on_intel do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.4.0/tmux-mcp_darwin_amd64.tar.gz"
      sha256 "3fb079db61f5608581c9be32a1b235b7a90790830ef802e48a96c3ab1552b0b9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.4.0/tmux-mcp_linux_arm64.tar.gz"
      sha256 "aa1011d74bcfd9d0faf57ab04e1ad2d4998868fca5876a2c809185f4bfaf9ffc"
    end
    on_intel do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.4.0/tmux-mcp_linux_amd64.tar.gz"
      sha256 "9ddd8f0e04efccfcb39cb23b42a3ac30c632a16b881f2133e3097798ecaad387"
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
