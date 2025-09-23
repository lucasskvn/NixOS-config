{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
    name = "web-dev-shell";
    buildInputs = [
        pkgs.nodejs
        pkgs.yarn
        pkgs.git
        pkgs.python3
        pkgs.deno
        pkgs.vscode
        pkgs.chromium
    ];
    shellHook = ''
        echo "Bienvenue dans votre environnement de développement web !"
    '';
}