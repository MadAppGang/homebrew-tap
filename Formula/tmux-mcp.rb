class TmuxMcp < Formula
  desc "MCP server for agent-oriented tmux control with native process detection"
  homepage "https://github.com/MadAppGang/tmux-mcp"
  version "1.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.3.0/tmux-mcp_darwin_arm64.tar.gz"
      sha256 "068c45a8bad34db4584757b9b99d178706fe0d7e7dbea7b26a39b54b0b54abfd"
    end
    on_intel do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.3.0/tmux-mcp_darwin_amd64.tar.gz"
      sha256 "543db868bca755e011f9bdae8926f35df8fc062bdc9390e21ace1bafebe4e389"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.3.0/tmux-mcp_linux_arm64.tar.gz"
      sha256 "2ba36843d23ced5525dc4b96b9c9559c6f5de7da9670dfcfa4cb42d02c8cf82b"
    end
    on_intel do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.3.0/tmux-mcp_linux_amd64.tar.gz"
      sha256 "047480fb10fafc0e9cf9494f057c93eb19e373e7ce11cd431d0ebf215bac93f8"
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
