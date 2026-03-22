class TmuxMcp < Formula
  desc "MCP server for agent-oriented tmux control with native process detection"
  homepage "https://github.com/MadAppGang/tmux-mcp"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.0.0/tmux-mcp_darwin_arm64.tar.gz"
      sha256 "00c401bddc6e73e7aff9318695faf8a02d9c809400be6564c7739acf4acc55c9"
    end
    on_intel do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.0.0/tmux-mcp_darwin_amd64.tar.gz"
      sha256 "daf5f8c4fd693839733f833e088e9e9f11fa48e66a809b8915a589b7873fe42d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.0.0/tmux-mcp_linux_arm64.tar.gz"
      sha256 "f040a4d90d7cb277768bcfc62a35d413f6e7a1d47328e96da24bdb447a4a82eb"
    end
    on_intel do
      url "https://github.com/MadAppGang/tmux-mcp/releases/download/v1.0.0/tmux-mcp_linux_amd64.tar.gz"
      sha256 "9bb0fcbb789e51acc41af9dccc0879b132a1603b165dafdbc306fbf6ba6237b8"
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
