class TmuxMcp < Formula
  desc "MCP server for agent-oriented tmux control with native process detection"
  homepage "https://github.com/MadAppGang/tmux-mcp"
  version "1.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.2.0/tmux-mcp_darwin_arm64.tar.gz"
      sha256 "24d364e8f7e1141a84e6f330f6c8c6285e8705b2e3c550c5ba867ed095035471"
    end
    on_intel do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.2.0/tmux-mcp_darwin_amd64.tar.gz"
      sha256 "4f465d48e3f19ce2cd48cc7571d7a41c10b2a58f01d37befa3a905dc8c68b918"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.2.0/tmux-mcp_linux_arm64.tar.gz"
      sha256 "85b567112389f1d39f374e0b8673a900e8dbb50456bcf89defc41b775b1f2b9c"
    end
    on_intel do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.2.0/tmux-mcp_linux_amd64.tar.gz"
      sha256 "d20cbdf86e4f19e796eb843ab8c1833f046c44a349426570bf7600b7992a34a5"
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
