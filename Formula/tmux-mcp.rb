class TmuxMcp < Formula
  desc "MCP server for agent-oriented tmux control with native process detection"
  homepage "https://github.com/MadAppGang/tmux-mcp"
  version "1.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.7.0/tmux-mcp_darwin_arm64.tar.gz"
      sha256 "74052be62b2fba9b773aafc7eb549f8e1c1f4f0b925ae37098f12ee8d2d716cc"
    end
    on_intel do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.7.0/tmux-mcp_darwin_amd64.tar.gz"
      sha256 "3e93eb37aa3fd62107500955be271d9ecb206099ced79f7d6d17361a48b6f872"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.7.0/tmux-mcp_linux_arm64.tar.gz"
      sha256 "2c16edfd01995d71363a1654f0f70840db39580b75ef9003bab3f19811e72ac1"
    end
    on_intel do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.7.0/tmux-mcp_linux_amd64.tar.gz"
      sha256 "5fcab3c1e8d8404cf269e705d8d5e06ec17eaae4bce777940510b5c8247749fb"
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
