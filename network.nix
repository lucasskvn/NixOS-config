{ config, pkgs, ... }:

{
  networking.hostName = "virtualangel";
  networking.networkmanager.enable = true;

  networking.firewall.checkReversePath = false; environment.systemPackages = with pkgs; [wireguard-tools protonvpn-gui]; 
}
