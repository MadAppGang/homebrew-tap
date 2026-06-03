class TmuxMcp < Formula
  desc "MCP server for agent-oriented tmux control with native process detection"
  homepage "https://github.com/MadAppGang/tmux-mcp"
  version "1.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.5.0/tmux-mcp_darwin_arm64.tar.gz"
      sha256 "c352bf9eb50ddd5b73a335715435e7629234ba7cc19478e49c06967af9b3df86"
    end
    on_intel do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.5.0/tmux-mcp_darwin_amd64.tar.gz"
      sha256 "39b8b0ecdb0fad0d18f3999cebce298e3a5b6a1affe665f3835dc8c7a9bbf339"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.5.0/tmux-mcp_linux_arm64.tar.gz"
      sha256 "d8005e4e0b55ef64613430bc0ca1ef228aaf6a3c883bb4d0911a839e7a7a8d3d"
    end
    on_intel do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.5.0/tmux-mcp_linux_amd64.tar.gz"
      sha256 "c561b43c8c4a8e4134fb4a7d69a78804e273757be609eacd238ab82dd67c00b5"
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
