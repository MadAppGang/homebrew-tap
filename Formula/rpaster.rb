class Rpaster < Formula
  desc "Paste clipboard images into remote tmux sessions over SSH"
  homepage "https://github.com/MadAppGang/tmux-copy-image"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/MadAppGang/tmux-copy-image/releases/download/v0.1.0/rpaster_darwin_amd64.tar.gz"
      sha256 "d83d7679065ff2fffc1f9542dbcb6b821895317afcee92b746f48ccb2615c05b"
    end

    on_arm do
      url "https://github.com/MadAppGang/tmux-copy-image/releases/download/v0.1.0/rpaster_darwin_arm64.tar.gz"
      sha256 "ae6f72afe0e0d7483018385176b33d7cf6cf61519c5353c2ea158ae06d17080c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MadAppGang/tmux-copy-image/releases/download/v0.1.0/rpaster_linux_amd64.tar.gz"
      sha256 "54844627c012fb316e4255c3e31f77a47c908edb8b357ceef538d5a6df56d474"
    end

    on_arm do
      url "https://github.com/MadAppGang/tmux-copy-image/releases/download/v0.1.0/rpaster_linux_arm64.tar.gz"
      sha256 "18337648cc1d149d530e0815b474d1a33ce3f02ab4f129498d1dfb8b265fab8b"
    end
  end

  def install
    bin.install "rpaster"
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
