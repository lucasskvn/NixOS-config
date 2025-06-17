{ config, pkgs, ... }:

{
  home.stateVersion = "25.05";

  nixpkgs.config.allowUnfree = true;

  home.packages = import ./packages.nix { inherit pkgs; };
  imports = [ ./dotfiles.nix ];

  home.sessionPath = [ "/home/lucasskvn/my_scripts" ];

  programs.hyprlock = {
    enable = true;
    settings = {
      background = [
        {
          monitor = "eDP-1";
          path = "/home/lucasskvn/Wallpapers/lock.jpg";
          blur_passes = 0;
          brightness = 1.0;
        }
      ];
    };
  };
}