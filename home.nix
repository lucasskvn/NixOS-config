{ config, pkgs, ... }:

{
  home.stateVersion = "25.05";

  nixpkgs.config.allowUnfree = true;

  # Importe la liste des paquets depuis packages.nix
  home.packages = import ./packages.nix { inherit pkgs; };

  home.file.".zshrc".source = /etc/nixos/config/.zshrc;
  home.file.".config/nvim".source = /etc/nixos/config/nvim;
  home.file.".config/kitty".source = /etc/nixos/config/kitty;
  home.file.".config/hypr".source = /etc/nixos/config/hypr;
  home.file.".config/rofi".source = /etc/nixos/config/rofi;
  home.file.".config/waybar".source = /etc/nixos/config/waybar;
}