{ config, pkgs, ... }:

{
  networking.hostName = "virtualangel";
  networking.networkmanager.enable = true;
}