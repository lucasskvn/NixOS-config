{ pkgs }:

with pkgs; [
    os-prober
    vim
    firefox
    neovim
    fzf
    proton-pass
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
    pkgs.dunst
    libnotify
    swww
    rofi-wayland
    rofi-power-menu
    hyprcursor
    hyprshot
    hyprpaper
    hyprlock
    waypaper
    xorg.libX11
    xorg.libXft
    xorg.libXinerama
    pkg-config
    # Hyprland
    hyprland
    nitrogen
    arandr
    gnumake
    libgccjit
    ripgrep
    mesa
    libglvnd
    wayland-utils
    # dwm
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
        src = ./config/suckless/dmenu;
        patches = [
          # (fetchpatch {
          #   url = "https://gitlab.freedesktop.org/wayland/dmenu/-/raw/refs/heads/master/patches/dmenu-wayland-0.8.5.diff";
          #   sha256 = "1a97q2hv63j2nq6vw924a6si8wg4903rbkrmml31zlhjgl9nbmq4";
          # })
        ];
    }))
    slstatus
    feh
    # I3
    i3
    i3blocks
    i3status
    i3lock
    alsa-utils
    acpi
    networkmanager
    playerctl
    brightnessctl
    pamixer
    nwg-look
    xclip
    pkgs.catppuccin-cursors
    vscode
    emacs
    nfs-utils
    rsync
    wget
    lazygit
    gcc
    mpv
    spotifyd
    neofetch
    jp2a
    imagemagick
    chafa
    catimg
    jellyfin-tui
    jellyfin
    jftui
    veracrypt
    obsidian
    pavucontrol
    mullvad-vpn
    pywal
    jq
    nemo
    pacman
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
]
