class Moox < Formula
  desc "Agentic tmux distribution: config, plugins, tt, Claude continuity, save/restore"
  homepage "https://github.com/MadAppGang/moox"
  version "0.1.0"
  # moox itself is MIT; the archive also ships tmux-jump unmodified under GPL-3.0.
  license all_of: ["MIT", "GPL-3.0-only"]

  depends_on "fzf"
  depends_on "jq" # the Claude SessionStart hook reads the session id with it
  depends_on "tmux"
  depends_on "tmux-fingers"

  on_macos do
    on_arm do
      url "https://github.com/MadAppGang/moox/releases/download/v0.1.0/moox_darwin_arm64.tar.gz"
      sha256 "9d9c63b7e211ccf1ca4ea22d94cea83834ba1b7c47c1e5a937466970cf090170"
    end
    on_intel do
      url "https://github.com/MadAppGang/moox/releases/download/v0.1.0/moox_darwin_amd64.tar.gz"
      sha256 "bd1bb21f0f9afe290be8f162c2b0067fd3a80e1920e1fb2793277436a8dc51e8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MadAppGang/moox/releases/download/v0.1.0/moox_linux_arm64.tar.gz"
      sha256 "e8b00d4b3ab78536f4c74938d55bfddfee5aa3eca0d531cabf7443af704bd0a5"
    end
    on_intel do
      url "https://github.com/MadAppGang/moox/releases/download/v0.1.0/moox_linux_amd64.tar.gz"
      sha256 "0be88db3f91a30df05367f99ca50f03b55c7657cd81bc475e751597a8b5cee91"
    end
  end

  conflicts_with "tt", because: "both install a `tt` binary (Tarantool's tt)"

  def install
    bin.install "moox", "tt", "rpaster"
    pkgshare.install Dir["share/moox/*"]
    doc.install "THIRD_PARTY.md", "README.md"
  end

  def caveats
    <<~EOS
      Run `moox` once to finish setup (it writes ~/.tmux.conf only after asking, with a backup).
      `tt` here is moox's tmux session manager, not Tarantool's `tt`.
    EOS
  end

  test do
    # Keep every tmux call (setup's theme detection lists clients) off the user's servers.
    ENV["TMUX_TMPDIR"] = testpath
    ENV.delete("TMUX")
    assert_match version.to_s, shell_output("#{bin}/moox --version")
    assert_match version.to_s, shell_output("#{bin}/tt --version")
    assert_path_exists pkgshare/"moox.conf"
    # HOME is brew's sandbox temp dir; --dry-run writes nothing.
    system bin/"moox", "setup", "--dry-run", "--yes"
  end
end
