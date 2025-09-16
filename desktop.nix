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
      (pkgs.fetchpatch {
        url = "https://dwm.suckless.org/patches/warp/dwm-warp-6.4.diff";
        sha256 = "03x6c3zksdwix7ydfgskgxlnsrixz5m95nh4k0a63bs914hj1kk9";
      })
      (pkgs.fetchpatch {
        url = "https://dwm.suckless.org/patches/alwayscenter/dwm-alwayscenter-20200625-f04cac6.diff";
        sha256 = "1hzq9crj13vxy4720xn2g0398fgwr12n7gd8j8wm6i45b56w34aw";
      })
      (pkgs.fetchpatch {
        url = "https://dwm.suckless.org/patches/steam/dwm-steam-6.2.diff";
        sha256 = "1ld1z3fh6p5f8gr62zknx3axsinraayzxw3rz1qwg73mx2zk5y1f";
      })
      (pkgs.fetchpatch {
        url = "https://dwm.suckless.org/patches/actualfullscreen/dwm-actualfullscreen-20211013-cb3f58a.diff";
        sha256 = "0882k8w6651c18ina0245b558f1bvqydcycw07lp711hpbg7f9gv";
      })
      (pkgs.fetchpatch {
        url = "https://dwm.suckless.org/patches/dragmfact/dwm-dragmfact-6.2.diff";
        sha256 = "0zalqbk3inkapgk4g1saiy1n0d7mb21hzs1if8lcb8cqfmascnk9";
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
