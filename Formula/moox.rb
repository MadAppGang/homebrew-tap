class Moox < Formula
  desc "Agentic tmux distribution: config, plugins, tt, Claude continuity, save/restore"
  homepage "https://github.com/MadAppGang/moox"
  version "0.1.3"
  # moox itself is MIT; the archive also ships tmux-jump unmodified under GPL-3.0.
  license all_of: ["MIT", "GPL-3.0-only"]

  depends_on "fzf"
  depends_on "jq" # the Claude SessionStart hook reads the session id with it
  depends_on "tmux"
  depends_on "tmux-fingers"

  on_macos do
    on_arm do
      url "https://github.com/MadAppGang/moox/releases/download/v0.1.3/moox_darwin_arm64.tar.gz"
      sha256 "0d35fa9d9b1304bbc4239a5e6b09e391ea959f96ec304e0d1a5e645c86caab1b"
    end
    on_intel do
      url "https://github.com/MadAppGang/moox/releases/download/v0.1.3/moox_darwin_amd64.tar.gz"
      sha256 "46173ac9bdc1a4b52744169d5667aeedcd657edb5c17554afb213c4f1ea65e6e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MadAppGang/moox/releases/download/v0.1.3/moox_linux_arm64.tar.gz"
      sha256 "51ca89a3da2845776b5c32c838e1eb3dca881dd427a939ef601d264d0483f190"
    end
    on_intel do
      url "https://github.com/MadAppGang/moox/releases/download/v0.1.3/moox_linux_amd64.tar.gz"
      sha256 "b9c0ae76e98103455ba2f763ac4418f6dbf6a61aef84b04719f3e52b56cebd43"
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
