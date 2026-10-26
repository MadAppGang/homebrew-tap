class Moox < Formula
  desc "Agentic tmux distribution: config, plugins, tt, Claude continuity, save/restore"
  homepage "https://github.com/MadAppGang/moox"
  version "0.1.4"
  # moox itself is MIT; the archive also ships tmux-jump unmodified under GPL-3.0.
  license all_of: ["MIT", "GPL-3.0-only"]

  depends_on "fzf"
  depends_on "jq" # the Claude SessionStart hook reads the session id with it
  depends_on "tmux"
  depends_on "tmux-fingers"

  on_macos do
    on_arm do
      url "https://github.com/MadAppGang/moox/releases/download/v0.1.4/moox_darwin_arm64.tar.gz"
      sha256 "569c01d6f41bcc3b0118fd31b9b816567df1451a4542d17d871ea1ebff31e8bd"
    end
    on_intel do
      url "https://github.com/MadAppGang/moox/releases/download/v0.1.4/moox_darwin_amd64.tar.gz"
      sha256 "759031ee5c15f48b4cb2097e0004095d2e1c2adf88746c6f1a108da9ed4ef7de"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MadAppGang/moox/releases/download/v0.1.4/moox_linux_arm64.tar.gz"
      sha256 "261c577772c5fdba234241af1a3c8f1632491c675c577d07884df401fd98ad7b"
    end
    on_intel do
      url "https://github.com/MadAppGang/moox/releases/download/v0.1.4/moox_linux_amd64.tar.gz"
      sha256 "dfc8b8663a2ff1d4fff31169fbc9f9d4fa76a72904d5e7ba284e7a3e4cd638be"
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
