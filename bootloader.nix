{ config, pkgs, ... }:

{
  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.useOSProber = true;

  # Si tu veux un thème custom, utilise pkgs.stdenv.mkDerivation :
  boot.loader.grub.theme = pkgs.stdenv.mkDerivation {
    name = "yorha-theme";
    src = /boot/grub/themes/yorha-1920x1080; # <-- le dossier, pas le fichier
    installPhase = ''
      mkdir -p $out
      cp -r $src/* $out/
    '';
  };
}