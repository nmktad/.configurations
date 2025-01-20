{ pkgs, inputs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    extraLuaPackages = ps: [
      ps.lua
      ps.luarocks-nix
      ps.magick
    ];
  };

  home.file.".config/nvim" = {
    source = ./nvim;
    recursive = true;
  };
}
