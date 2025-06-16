{ config, pkgs, ... }:

{
  home.stateVersion = "25.05";

  nixpkgs.config.allowUnfree = true;

  home.packages = import ./packages.nix { inherit pkgs; };
  imports = [ ./dotfiles.nix ];
}