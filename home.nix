{ config, pkgs, ... }:

let
  secrets = import ./secrets.nix;
in
{
  home.stateVersion = "25.05";

  nixpkgs.config.allowUnfree = true;

  home.packages = import ./packages.nix { inherit pkgs; };
  imports = [ ./dotfiles.nix ];

  home.sessionPath = [ "/home/lucasskvn/my_scripts" ];

  # programs.hyprlock = {
  #   enable = true;
  #   settings = {
  #     background = [
  #       {
  #         monitor = "eDP-1";
  #         path = "/home/lucasskvn/Wallpapers/lock.jpg";
  #         blur_passes = 0;
  #         brightness = 1.0;
  #       }
  #     ];
  #   };
  # };

  # Exemple : passer les secrets comme variables d'environnement
  home.sessionVariables = {
    JFTUI_SERVER = secrets.jftui_server;
    JFTUI_TOKEN = secrets.jftui_token;
    JFTUI_USERID = secrets.jftui_userid;
    JFTUI_SSL_VERIFYHOST = builtins.toString secrets.jftui_ssl_verifyhost;
    JFTUI_CLIENT = secrets.jftui_client;
    JFTUI_DEVICE = secrets.jftui_device;
    JFTUI_DEVICEID = secrets.jftui_deviceid;
    JFTUI_VERSION = secrets.jftui_version;
    JFTUI_TRY_LOCAL_FILES = builtins.toString secrets.jftui_try_local_files;
  };
}