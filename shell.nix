{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.gcc
    pkgs.sfml
    pkgs.csfml
    pkgs.diffutils
    # Ajoute ici d'autres dépendances nécessaires à ton projet
  ];
  nativeBuildInputs = [ pkgs.diffutils ];
}