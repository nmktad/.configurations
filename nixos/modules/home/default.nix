{ inputs, vars, pkgs, ... }:

{
  imports = [
    ../programs/tui
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  nixpkgs.overlays = [
    inputs.nur.overlay
    inputs.nix-vscode-extensions.overlays.default
  ];

  # User packages. IE not system packages
  home = {
    username = "${vars.user.name}";
    homeDirectory = "/home/${vars.user.name}";
    packages = with pkgs; [
      ollama
      ripgrep
      go
  };

  programs.home-manager.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
