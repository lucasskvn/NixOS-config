# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./bootloader.nix
      ./users.nix
      ./desktop.nix
      ./network.nix
      ./locales.nix
      ./fonts.nix
      ./development.nix
      <home-manager/nixos>
    ];

  # Autoriser les paquets non libres pour le système
  nixpkgs.config.allowUnfree = true;

  # Paquets système globaux (optionnel)
  environment.systemPackages = import ./packages.nix { inherit pkgs; };

  # Home Manager
  home-manager.users.lucasskvn = import ./home.nix;

  # Version NixOS
  system.stateVersion = "25.05";

  # Variables d'environnement
  environment.variables = {
    NIXOS_OZONE_WL = "1";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
  };

  services.mullvad-vpn.enable = true;

  # Ajout de la configuration de la collecte automatique des ordures Nix
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nix.optimise.automatic = true;

  users.users.lucasskvn.extraGroups = [ "docker" "networkmanager" "wheel" ];
  virtualisation.docker.enable = true;

  services.xserver = {
    enable = true;
    videoDrivers = [ "modesetting" ];
  };

  # Supprime complètement la section hardware.nvidia si tu n'as pas de carte NVIDIA

  programs.hyprland.enable = true;

  programs.steam.enable = true;

  services.mpd = {
    enable = true;
    musicDirectory = "/home/lucasskvn/Musique"; # adapte ce chemin si besoin
    user = "lucasskvn";
  };

  security.wrappers.slock = {
    source = "${pkgs.slock}/bin/slock";
    owner = "root";
    group = "root";
    setuid = true;
  };

  # Auto-mount USB
  services.udisks2.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Audio amélioré
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  # Impression
  services.printing.enable = true;
  services.avahi.enable = true; # Pour découverte réseau

  # Firewall intelligent
  networking.firewall.allowPing = true;

  # SSD optimisation
  services.fstrim.enable = true;

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc   # libstdc++, libgcc_s
      zlib
      zstd
      bzip2
      xz
      glib
      openssl
      curl           # libcurl
      libxml2
      sqlite
      nghttp2
      icu
    ];
  };
}
