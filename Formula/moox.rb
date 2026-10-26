class Moox < Formula
  desc "Agentic tmux distribution: config, plugins, tt, Claude continuity, save/restore"
  homepage "https://github.com/MadAppGang/moox"
  version "0.1.2"
  # moox itself is MIT; the archive also ships tmux-jump unmodified under GPL-3.0.
  license all_of: ["MIT", "GPL-3.0-only"]

  depends_on "fzf"
  depends_on "jq" # the Claude SessionStart hook reads the session id with it
  depends_on "tmux"
  depends_on "tmux-fingers"

  on_macos do
    on_arm do
      url "https://github.com/MadAppGang/moox/releases/download/v0.1.2/moox_darwin_arm64.tar.gz"
      sha256 "9b8371bd4e680a0cd49dd4d9e050451013bddd72a920242e4add7ebb336ba542"
    end
    on_intel do
      url "https://github.com/MadAppGang/moox/releases/download/v0.1.2/moox_darwin_amd64.tar.gz"
      sha256 "9017eab5db83a880c77a96b183fd0b33fb576cc701929138f295be614afc09b5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MadAppGang/moox/releases/download/v0.1.2/moox_linux_arm64.tar.gz"
      sha256 "8450ec2f80b3997aa147660887bb41e8ea970dc34958b1eca2f0b6fa787d4848"
    end
    on_intel do
      url "https://github.com/MadAppGang/moox/releases/download/v0.1.2/moox_linux_amd64.tar.gz"
      sha256 "fa4cc9d4d40ddd02ea7f13c1e1f96a69f54b33213325d6af67be9ee4b490123a"
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
