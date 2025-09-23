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
        sha256 = "b05/wbtyOEO4jj4bEKSU7m882J0CVATcmc3SM6kFpKk=";
      })
      (pkgs.fetchpatch {
        url = "https://dwm.suckless.org/patches/warp/dwm-warp-6.4.diff";
        sha256 = "8z41ld47/2WHNJi8JKQNw76umCtD01OUQKSr/fehfLw=";
      })
      (pkgs.fetchpatch {
        url = "https://dwm.suckless.org/patches/alwayscenter/dwm-alwayscenter-20200625-f04cac6.diff";
        sha256 = "xQEwrNphaLOkhX3ER09sRPB3EEvxC73oNWMVkqo4iSY=";
      })
      (pkgs.fetchpatch {
        url = "https://dwm.suckless.org/patches/steam/dwm-steam-6.2.diff";
        sha256 = "f3lffBjz7+0Khyn9c9orzReoLTqBb/9gVGshYARGdVc=";
      })
      (pkgs.fetchpatch {
        url = "https://dwm.suckless.org/patches/actualfullscreen/dwm-actualfullscreen-20211013-cb3f58a.diff";
        sha256 = "vsTuudJCy7Zo1wdwpI/nY7Zu1txXx90QoDfJLmfDUH8=";
      })
      (pkgs.fetchpatch {
        url = "https://dwm.suckless.org/patches/dragmfact/dwm-dragmfact-6.2.diff";
        sha256 = "9sheyooivh29GCOdxsXZAs6JOWM/e03synVMBIDbAnk=";
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
