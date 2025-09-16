{ pkgs }:

with pkgs; [
    os-prober
    vim
    firefox
    neovim
    fzf
    proton-pass
    protonvpn-gui
    git
    discord
    spotify
    spicetify-cli
    kitty
    thunderbird
    zsh
    oh-my-zsh
    (pkgs.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      })
    )
    arandr
    # Hyprland
    # pkgs.dunst
    # libnotify
    # swww
    # rofi-wayland
    # rofi-power-menu
    # hyprcursor
    # hyprshot
    # hyprpaper
    # hyprlock
    # waypaper
    # hyprland
    # nitrogen
    # libgccjit
    ripgrep
    flameshot
    scrot
    # mesa
    # libglvnd
    # wayland-utils
    pkg-config
    gnumake
    xorg.libX11
    xorg.libXft
    xorg.libXinerama
    # dwm / SUCKLESS
    imlib2
    zlib
    pciutils
    (st.overrideAttrs (oldAttrs: rec {
        patches = [
          (fetchpatch {
            url = "https://st.suckless.org/patches/clickurl-nocontrol/st-clickurl-nocontrol-0.9.2.diff";
            sha256 = "13lqsbgkzbjkj51zc9m4k55szkv6rbc0kjap1l7c03gyc1a46b6x";
          })
          (fetchpatch {
            url = "https://st.suckless.org/patches/drag-n-drop/st-drag-n-drop-0.9.2.diff";
            sha256 = "02grbd3sd015y406akz42qyzxzcdnvb1akrwbjv0hdl388gzsh43";
          })
          (fetchpatch {
            url = "https://st.suckless.org/patches/dynamic-cursor-color/st-dynamic-cursor-color-0.9.diff";
            sha256 = "1hpyk30a5mkj3lplmxhp8j61y3yxmsg8sx5wjfbvcriv43fcdb5a";
          })
        ];
    }))
    (dmenu.overrideAttrs (oldAttrs: rec {
        version = "5.2";
        src = pkgs.fetchurl {
          url = "https://dl.suckless.org/tools/dmenu-5.2.tar.gz";
          sha256 = "14ipsirsfqbyqlnna0k8yla5j6mrbgh3gd9d4xrg4h4inmvwmm6l";
        };
        patches = [
          (fetchpatch {
            url = "https://tools.suckless.org/dmenu/patches/center/dmenu-center-5.2.diff";
            sha256 = "1jck88ypx83b73i0ys7f6mqikswgd2ab5q0dfvs327gsz11jqyws";
          })
        ];
    }))
    (sent.overrideAttrs (oldAttrs: rec {
        patches = [
          (fetchpatch {
            url = "https://tools.suckless.org/sent/patches/progress-bar/sent-progress-bar-1.0.diff";
            sha256 = "0l7zva7nghmslrfs65grmdv54byygng8xdzzq61q42w9b4g5vbdc";
          })
        ];
    }))
    (slock.overrideAttrs (oldAttrs: rec {
        patches = [
        ];
    }))
    (slstatus.overrideAttrs (oldAttrs: rec {
        src = ./config/suckless/slstatus;
        patches = [
          (fetchpatch {
            url = "https://tools.suckless.org/slstatus/patches/backlight/slstatus-backlight-4bd78c9.diff";
            sha256 = "13v8pqnpzb3agz3iyg0gwfrpwsdqhzf9s13z4b956pnsy4i3hibn";
          })
          (fetchpatch {
            url = "https://tools.suckless.org/slstatus/patches/alsa/slstatus-alsa-4bd78c9.patch";
            sha256 = "03jn956qlfkawlpasdhxl4069nnrr56psa9my60nyvynxq1gkb4r";
          })
        ];
    }))
    (surf.overrideAttrs (oldAttrs: rec {
        patches = [
        ];
    }))
    sxiv
    lf
    zathura
    feh
    networkmanager
    brightnessctl
    xclip
    # I3
    # i3
    # i3blocks
    # i3status
    # i3lock
    # alsa-utils
    # acpi
    # playerctl
    # pamixer
    # nwg-look
    # pkgs.catppuccin-cursors
    # lazygit
    vscode
    emacs
    nfs-utils
    rsync
    wget
    gcc
    mpv
    ffmpeg
    mpc
    spotifyd
    neofetch
    jp2a
    imagemagick
    chafa
    catimg
    jellyfin-tui
    jellyfin
    jftui
    obsidian
    pavucontrol
    mullvad-vpn
    pywal
    jq
    nemo
    pkgs.nerd-fonts.fira-code
    pkgs.nerd-fonts.iosevka
    tmux
    docker
    neomutt
    isync
    msmtp
    pass
    gettext
    mutt-wizard
    gnupg1
    pinentry
    pulseaudio
    librewolf
    ncurses
    pkgs.linuxPackages.nvidia_x11
    steam
    nodejs_24
]
