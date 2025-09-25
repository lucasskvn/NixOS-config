{ config, pkgs, ... }: {
  programs.home-manager.enable = true;
  
  # Git config globale
  programs.git = {
    enable = true;
    userName = "lucasskvn";
    userEmail = "lucas.sangkhavongs@epitech.eu";
    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
    };
  };
  
  # Starship prompt
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
  
  # Direnv pour projets
  programs.direnv.enable = true;
}