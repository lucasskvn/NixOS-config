{ config, pkgs, ... }:

{
  home.file.".zshrc".source = /etc/nixos/config/.zshrc;
  home.file.".config/nvim".source = /etc/nixos/config/nvim;
  home.file.".config/kitty".source = /etc/nixos/config/kitty;
  home.file.".config/hypr".source = /etc/nixos/config/hypr;
  home.file.".config/rofi".source = /etc/nixos/config/rofi;
  home.file.".config/waybar".source = /etc/nixos/config/waybar;
  home.file.".gitconfig".source = /etc/nixos/config/.gitconfig;
  home.file.".p10k.zsh".source = /etc/nixos/config/.p10k.zsh;
}