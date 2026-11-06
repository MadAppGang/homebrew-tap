class TmuxMcp < Formula
  desc "MCP server for agent-oriented tmux control with native process detection"
  homepage "https://github.com/MadAppGang/tmux-mcp"
  version "2.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v2.1.0/tmux-mcp_darwin_arm64.tar.gz"
      sha256 "acc71a8013ec94872bc7c134c655ed60b8caa03c210811fa0659eaab4d442b69"
    end
    on_intel do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v2.1.0/tmux-mcp_darwin_amd64.tar.gz"
      sha256 "f6a76e225e1c4d0a271f895cd1d6f54c2a2a0ece7f82c896ea587791398055a4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v2.1.0/tmux-mcp_linux_arm64.tar.gz"
      sha256 "2854bb03776681b5b9fe5e04cd472435b3c6dd74cee91f24748c24b7797506c3"
    end
    on_intel do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v2.1.0/tmux-mcp_linux_amd64.tar.gz"
      sha256 "c07377330455fd08e43d8dd22d589dd11f716676aff7f9268bb6414a339dd6de"
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
