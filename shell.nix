{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.gcc
    pkgs.sfml
    pkgs.csfml
    # Ajoute ici d'autres dépendances nécessaires à ton projet
  ];
}