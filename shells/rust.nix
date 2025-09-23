{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    # Rust toolchain
    rustc
    cargo
    rustfmt
    rust-analyzer
    clippy
    
    # Build tools
    pkg-config
    openssl
    
    # Development tools
    cargo-watch
    cargo-edit
    cargo-expand
    cargo-outdated
    cargo-audit
    bacon  # Background rust code checker
    
    # System libraries commonly needed
    gcc
    glibc
    
    # Git for version control
    git
    
    # Database drivers (common for Rust apps)
    sqlite
    postgresql
    
    # Optional: WASM tools
    wasm-pack
    
    # Cross-compilation tools
    # cargo-cross
  ];
  
  # Environment variables
  RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
  
  shellHook = ''
    echo "🦀 Environnement Rust activé!"
    echo "Outils disponibles:"
    echo "  - Rust $(rustc --version | cut -d' ' -f2)"
    echo "  - Cargo $(cargo --version | cut -d' ' -f2)"
    echo "  - rust-analyzer pour LSP"
    echo "  - clippy pour les lints"
    echo "  - cargo-watch pour compilation auto"
    echo "  - bacon pour vérification continue"
    echo ""
    echo "Commandes utiles:"
    echo "  cargo new mon-projet      # Nouveau projet"
    echo "  cargo watch -x run        # Compilation auto"
    echo "  bacon                     # Vérification continue"
    echo ""
  '';
}