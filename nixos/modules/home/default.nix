{ inputs, vars, pkgs, ... }:

{
  imports = [
    ../programs
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  nixpkgs.overlays = [
    inputs.nur.overlay
  ];

  # User packages. IE not system packages
  home = {
    username = "${vars.user.name}";
    homeDirectory = "/home/${vars.user.name}";
    packages = with pkgs; [
      ollama
      ripgrep
      starship
      go
    ];

    file.".config/nvim" = {
      source = "${inputs.dotfiles}/nvim/.config/nvim";
      recursive = true;
    };
  };

  programs.home-manager.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
