class Rpaster < Formula
  desc "Paste clipboard images into remote tmux sessions over SSH"
  homepage "https://github.com/MadAppGang/tmux-copy-image"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/tmux-copy-image/releases/download/v0.1.1/rpaster_darwin_amd64.tar.gz"
      sha256 "1547025c7cb681a8e8075f388710d0240db97f1fdc0ddaa97be2232c6106a39c"
    end

    on_arm do
      url "https://github.com/MadAppGang/tmux-copy-image/releases/download/v0.1.1/rpaster_darwin_arm64.tar.gz"
      sha256 "0602e793ac264f942d6429b1a361f8aa7db72ab136393068e2359c1d9dab586e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/tmux-copy-image/releases/download/v0.1.1/rpaster_linux_amd64.tar.gz"
      sha256 "b1fb731bb05a2a8578a2f8f52741a19aecf18fcd13c6e53a127d8fd1ce0b4229"
    end

    on_arm do
      url "https://github.com/MadAppGang/tmux-copy-image/releases/download/v0.1.1/rpaster_linux_arm64.tar.gz"
      sha256 "67fe04fd5171f6344566e790d0838fc5e5791cccd22c0d584fed46a3eeeca12c"
    end
  end

  def install
    bin.install "rpaster"
  end

  def caveats
    <<~EOS
      ┌─────────────────────────────────────────────────────┐
      │  rpaster — clipboard image paste over SSH           │
      └─────────────────────────────────────────────────────┘

      Step 1: Start the daemon (runs on login automatically)

        brew services start rpaster

      Step 2: Add SSH tunnel to your remote host(s)

        Add to ~/.ssh/config:

          Host your-remote-host
              RemoteForward 127.0.0.1:18339 127.0.0.1:18339

      Step 3: Install tmux plugin on the remote machine

        ssh your-remote-host
        mkdir -p ~/.tmux/plugins/tmux-clip-image/scripts
        # Copy plugin files (or use the installer):
        rpaster install --remote your-remote-host

        Or manually add to remote ~/.tmux.conf:
          run-shell ~/.tmux/plugins/tmux-clip-image/tmux-clip-image.tmux

      Step 4: Use it!

        SSH to your remote, open tmux, copy an image locally,
        then press:  prefix + V

        The image file path will appear in your tmux pane.

      Verify setup:  rpaster doctor
      More info:     https://github.com/MadAppGang/tmux-copy-image
    EOS
  end

  service do
    run [opt_bin/"rpaster", "serve"]
    keep_alive true
    log_path var/"log/rpaster.log"
    error_log_path var/"log/rpaster.log"
  end

  test do
    system "#{bin}/rpaster", "version"
  end
end
