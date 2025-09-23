{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
    buildInputs = with pkgs; [
        gcc
        gdb
        gnumake
        pkg-config
        csfml
    ];

    shellHook = ''
        echo "C development environment loaded"
        echo "Available tools: gcc, gdb, make, pkg-config, csfml"
    '';
}