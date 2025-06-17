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
  };
}
