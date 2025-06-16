{ config, pkgs, ... }:

{
  networking.hostName = "lucasskvnnixos";
  networking.networkmanager.enable = true;
}