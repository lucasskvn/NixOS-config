{ pkgs ? import <nixpkgs> {} }:

# Ensure CSFML/SFML runtime libraries are found when running your binaries
let
  libPath = pkgs.lib.makeLibraryPath [ pkgs.csfml pkgs.sfml ];
in
pkgs.mkShell {
  buildInputs = with pkgs; [
    # Compilateurs et outils de build
    gcc
    clang
    cmake
    gnumake
    pkg-config
    csfml
    
    # Langages de programmation
    python3
    python3Packages.pip
    python3Packages.virtualenv
    nodejs
    nodePackages.npm
    nodePackages.yarn
    go
    rustc
    cargo
    
    # Outils système et réseau
    curl
    wget
    git
    tree
    htop
    neofetch
    
    # Outils de développement
    neovim
    tmux
    fzf
    ripgrep
    fd
    zsh
    oh-my-zsh
    starship
    
    # Bibliothèques spécifiques à tes projets
    sfml
    csfml
    
    # Outils utilitaires
    diffutils
    file
    which
    unzip
    zip
    
    # Docker et containers (optionnel)
    docker
    docker-compose
  ];
  
  nativeBuildInputs = with pkgs; [ 
    diffutils
    pkg-config
  ];

  # Make zsh the interactive shell inside nix-shell
  SHELL = "${pkgs.zsh}/bin/zsh";

  # Embed RPATH at link time so binaries can run without relying on the shell
  # NIX_LDFLAGS is passed directly to ld by nix wrappers, so do NOT use -Wl,
  NIX_LDFLAGS = "-rpath ${pkgs.csfml}/lib -rpath ${pkgs.sfml}/lib";
  
  shellHook = ''
    # Make runtime linker see CSFML/SFML while in nix-shell
    export LD_LIBRARY_PATH=${libPath}:$LD_LIBRARY_PATH

    # Ensure your zsh + oh-my-zsh config is used inside nix-shell
    export SHELL=${pkgs.zsh}/bin/zsh
    export ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh
    # If your .zshrc expects ~/.oh-my-zsh, create a compatibility symlink
    if [ ! -e "$HOME/.oh-my-zsh" ]; then
      ln -sfn ${pkgs.oh-my-zsh}/share/oh-my-zsh "$HOME/.oh-my-zsh"
    fi
    # Switch to zsh only if we're not already in zsh
    if [ -z "$ZSH_VERSION" ]; then
      echo "🔁 Passage automatique sur zsh (avec votre config) dans le nix-shell..."
      exec ${pkgs.zsh}/bin/zsh -i
    fi

    echo "🚀 Environnement de développement polyvalent activé!"
    echo "Langages disponibles:"
    echo "  - Python $(python3 --version 2>&1 | cut -d' ' -f2)"
    echo "  - Node.js $(node --version)"
    echo "  - Go $(go version | cut -d' ' -f3)"
    echo "  - Rust $(rustc --version | cut -d' ' -f2)"
    echo "  - GCC $(gcc --version | head -1 | cut -d' ' -f4)"
    echo ""
    echo "Tapez 'exit' pour quitter l'environnement nix-shell"
  '';
}