{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  # services.xserver.displayManager.gdm.wayland = false;
  services.xserver.desktopManager.gnome.enable = true;

  # Active DWM
  services.xserver.windowManager.dwm.enable = true;
  services.xserver.windowManager.dwm.package = pkgs.dwm.overrideAttrs {
    src = ./config/suckless/dwm;
    patches = [
      (pkgs.fetchpatch {
        url = "https://dwm.suckless.org/patches/amixer-integration/dwm-amixer-integration-6.5.diff";
        sha256 = "0gkpx2d8d2ypbjsqzddrx0zmiqs327aiayxnrqmk2kpqlclqj09s";
      })
    ];
  };

  # # Active i3
  # services.xserver.windowManager.i3.enable = true;

  # # Active Hyprland
  # programs.hyprland.enable = true;
  # xdg.portal.enable = true;
  # xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
}
