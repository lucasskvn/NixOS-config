{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    # Compilateurs et outils de build
    gcc
    clang
    cmake
    gnumake
    pkg-config
    
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
  
  shellHook = ''
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