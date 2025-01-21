{ lib, ... }:
rec {
  user = {
    name = "nmktad";
    fullName = "Nathnael Mekonnen";
    email = "nmktad@gmail.com";
    packages = {
      editor = "nvim";
      shell = "zsh"; 
    };
  };

  paths = {
    dotfiles = "$HOME/.dotfiles";
    configHome = "$HOME/.config";
    scriptsHome = "$HOME/.local/scripts";
    dataHome = "$HOME/.local/share";
    cacheHome = "$HOME/.cache";
  };

  system = {
    timeZone = "Africa/Addis_Ababa";
    locale = "en_US.UTF-8";
    stateVersion = "24.05";
  };
  
  networking = {
    domain = "local";
  };
}