{ config, pkgs, ... }:

{
  users.users.lucasskvn = {
    isNormalUser = true;
    description = "lucasskvn";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = [ ];
    shell = pkgs.zsh;
  };

  environment.shells = with pkgs; [ zsh ];
  programs.zsh.enable = true;
}