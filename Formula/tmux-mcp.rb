class TmuxMcp < Formula
  desc "MCP server for agent-oriented tmux control with native process detection"
  homepage "https://github.com/MadAppGang/tmux-mcp"
  version "1.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.3.0/tmux-mcp_darwin_arm64.tar.gz"
      sha256 "a7190e540280ecc2acce08da1b045949c715dc459ed521285a518b7675816784"
    end
    on_intel do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.3.0/tmux-mcp_darwin_amd64.tar.gz"
      sha256 "32eef279d278a0c773c41bff6d3fbfa2edacb7b1ce509f87b9398d473e318127"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.3.0/tmux-mcp_linux_arm64.tar.gz"
      sha256 "38b2e9bdb5ae41a50027312904a473cb8a6e3a5d4cc94605d193047e7497e453"
    end
    on_intel do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.3.0/tmux-mcp_linux_amd64.tar.gz"
      sha256 "aa7c1d18760542124151508a837c8aa7901b793098e4d97506cbb1a210bf9c16"
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
