class TmuxMcp < Formula
  desc "MCP server for agent-oriented tmux control with native process detection"
  homepage "https://github.com/MadAppGang/tmux-mcp"
  version "1.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.7.1/tmux-mcp_darwin_arm64.tar.gz"
      sha256 "1affd6e010d9030e52ab8777fa55dc2bc4ba94ada709b7cd03570dae5e5872d2"
    end
    on_intel do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.7.1/tmux-mcp_darwin_amd64.tar.gz"
      sha256 "9a278ee7742b6fe9ebcf35eb12ecd6353a01388e0fa2047e4a40576dba9827f2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.7.1/tmux-mcp_linux_arm64.tar.gz"
      sha256 "8856d90ca74da2a8e19f80074778dcb17904501edd06ab9143850cb8ad6fb7e6"
    end
    on_intel do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.7.1/tmux-mcp_linux_amd64.tar.gz"
      sha256 "f413c0e8ffdf80251434118746d5e0fff0a10037b379fcff82f8bc4dbe7729c9"
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
