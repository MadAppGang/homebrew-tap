class TmuxMcp < Formula
  desc "MCP server for agent-oriented tmux control with native process detection"
  homepage "https://github.com/MadAppGang/tmux-mcp"
  version "1.6.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.6.3/tmux-mcp_darwin_arm64.tar.gz"
      sha256 "3071b2ea8baa667a447def8b6186e41d011f1431e18bcee0ff76f4efd9531eb7"
    end
    on_intel do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.6.3/tmux-mcp_darwin_amd64.tar.gz"
      sha256 "6aba9cc6bc16c585e4df8a93fb4a3bae788268d9822bccb3a377741788a248cd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.6.3/tmux-mcp_linux_arm64.tar.gz"
      sha256 "c55e4a24fadc0dbedb831d732fc752bb107ce2d6db7ce319bdea354490e1f363"
    end
    on_intel do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.6.3/tmux-mcp_linux_amd64.tar.gz"
      sha256 "818af685164e6ff0b0c2293cf405d3c247d04a4e3fb8dff1659c26fc0740bd51"
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
