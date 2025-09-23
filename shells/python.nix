{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
    buildInputs = with pkgs; [
        python3
        python3Packages.pip
        python3Packages.virtualenv
    ];

    shellHook = ''
        echo "Python development environment loaded"
        python --version
    '';
}