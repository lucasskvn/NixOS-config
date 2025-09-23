# Configuration pour le développement
{ config, pkgs, ... }:

{
  # Languages de programmation
  programs = {
    # Java
    java.enable = true;
    
    # Node.js avec npm global
    npm.enable = true;
  };

  # Services de développement
  services = {
    # Base de données PostgreSQL
    postgresql = {
      enable = true;
      package = pkgs.postgresql_15;
      enableTCPIP = true;
      authentication = pkgs.lib.mkOverride 10 ''
        local all all trust
        host all all 127.0.0.1/32 trust
        host all all ::1/128 trust
      '';
      initialScript = pkgs.writeText "backend-initScript" ''
        CREATE ROLE lucasskvn WITH LOGIN PASSWORD 'password' CREATEDB;
        CREATE DATABASE lucasskvn;
        GRANT ALL PRIVILEGES ON DATABASE lucasskvn TO lucasskvn;
      '';
    };

    # Redis
    redis.servers."".enable = true;
    
    # MongoDB (optionnel)
    # mongodb.enable = true;
  };

  # Variables d'environnement de développement
  environment.variables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERM = "kitty";
  };
}
