class Moox < Formula
  desc "Agentic tmux distribution: config, plugins, tt, Claude continuity, save/restore"
  homepage "https://github.com/MadAppGang/moox"
  version "0.1.1"
  # moox itself is MIT; the archive also ships tmux-jump unmodified under GPL-3.0.
  license all_of: ["MIT", "GPL-3.0-only"]

  depends_on "fzf"
  depends_on "jq" # the Claude SessionStart hook reads the session id with it
  depends_on "tmux"
  depends_on "tmux-fingers"

  on_macos do
    on_arm do
      url "https://github.com/MadAppGang/moox/releases/download/v0.1.1/moox_darwin_arm64.tar.gz"
      sha256 "27b3bb4fc10837fe16877da302cded9fc2b062ecf83ffd23d6d2bdcf38d72737"
    end
    on_intel do
      url "https://github.com/MadAppGang/moox/releases/download/v0.1.1/moox_darwin_amd64.tar.gz"
      sha256 "9cd368e84bba52f97f51ed5d03ccc3e2ebb473c498d6ceae59d8a22bc8207ef7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MadAppGang/moox/releases/download/v0.1.1/moox_linux_arm64.tar.gz"
      sha256 "6931230ca98e0b3e86e40c396d91cf42cc6766db355d3a36d445fa88f3750101"
    end
    on_intel do
      url "https://github.com/MadAppGang/moox/releases/download/v0.1.1/moox_linux_amd64.tar.gz"
      sha256 "2edfbc1e1738fd7ba3afa93e1bd7fea6df1bdc0149829dd973b7e3e55c083850"
    end
  end

  conflicts_with "tt", because: "both install a `tt` binary (Tarantool's tt)"

  def install
    bin.install "moox", "tt"
    # Not bin/: madappgang/tap/rpaster owns bin/rpaster, and a second one makes
    # `brew link` refuse ALL of moox's binaries. moox finds it here itself.
    libexec.install "rpaster"
    pkgshare.install Dir["share/moox/*"]
    doc.install "THIRD_PARTY.md", "README.md"
  end

  def caveats
    <<~EOS
      Run `moox` once to finish setup (it writes ~/.tmux.conf only after asking, with a backup).
      `tt` here is moox's tmux session manager, not Tarantool's `tt`.
      moox's copy-image helper is not linked as `rpaster` (madappgang/tap/rpaster owns that
      name and is left alone); run it as `moox rpaster ...`.
    EOS
  end

  test do
    # Keep every tmux call (setup's theme detection lists clients) off the user's servers.
    ENV["TMUX_TMPDIR"] = testpath
    ENV.delete("TMUX")
    assert_match version.to_s, shell_output("#{bin}/moox --version")
    assert_match version.to_s, shell_output("#{bin}/tt --version")
    assert_path_exists pkgshare/"moox.conf"
    assert_match version.to_s, shell_output("#{bin}/moox rpaster version")
    refute_path_exists bin/"rpaster"
    # HOME is brew's sandbox temp dir; --dry-run writes nothing.
    system bin/"moox", "setup", "--dry-run", "--yes"
  end
end
