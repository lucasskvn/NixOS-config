{ config, pkgs, ... }:

{
  home.file.".zshrc".source = ./config/.zshrc;
  home.file.".config/nvim".source = ./config/nvim;
  home.file.".config/kitty".source = ./config/kitty;
  home.file.".config/hypr".source = ./config/hypr;
  home.file.".config/rofi".source = ./config/rofi;
  home.file.".config/i3".source = ./config/i3;
  home.file.".config/i3blocks".source = ./config/i3blocks;
  home.file.".config/waybar".source = ./config/waybar;
  home.file.".gitconfig".source = ./config/.gitconfig;
  home.file.".p10k.zsh".source = ./config/.p10k.zsh;
  home.file.".config/neofetch".source = ./config/neofetch;
  home.file.".local/bin".source = ./config/my_scripts;
  home.file.".config/zathura".source = ./config/zathura;
  home.file.".tmux.conf".source = ./config/tmux/tmux.conf;
  home.file.".config/starship.toml".source = ./config/starship/starship.toml;
  home.file.".config/lf".source = ./config/lf;
}