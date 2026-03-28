class TmuxMcp < Formula
  desc "MCP server for agent-oriented tmux control with native process detection"
  homepage "https://github.com/MadAppGang/tmux-mcp"
  version "1.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.3.0/tmux-mcp_darwin_arm64.tar.gz"
      sha256 "3acb152074e6cce3c960f726a5fe40cc71d43e86b6b11c30b91c7fa165fdcfcb"
    end
    on_intel do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.3.0/tmux-mcp_darwin_amd64.tar.gz"
      sha256 "f596a461d40ec4276517123bc2f0e0c797734c71911d4a77252401288d338689"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.3.0/tmux-mcp_linux_arm64.tar.gz"
      sha256 "6b0c39fc2700c11e43ef0fce2b742e318156771ee65822d03f35290e49fac803"
    end
    on_intel do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.3.0/tmux-mcp_linux_amd64.tar.gz"
      sha256 "cfcd06770ee59edd77d8a763960030855b5d9ab06f262c4efc8166940a2ce880"
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
