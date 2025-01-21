{ pkgs, ... }:

let
  opacity = 0.95;
  fontSize = 11;
in
{
  stylix = {
    enable = true;
    polarity = "dark";
    image = pkgs.fetchurl {
      url = "https://www.pixelstalk.net/wp-content/uploads/2016/05/Epic-Anime-Awesome-Wallpapers.jpg";
      sha256 = "enQo3wqhgf0FEPHj2coOCvo7DuZv+x5rL/WIo4qPI50=";
    };
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";

    # fonts = {
    #   monospace = {
    #     # package = pkgs.nerdfonts.jetbrains-mono;
    #     package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
    #     name = "JetBrainsMono Nerd Font Mono";
    #   };
    #   sansSerif = {
    #     package = pkgs.dejavu_fonts;
    #     name = "DejaVu Sans";
    #   };
    #   serif = {
    #     package = pkgs.dejavu_fonts;
    #     name = "DejaVu Serif";
    #   };

    #   sizes = {
    #     applications = fontSize;
    #     desktop = fontSize;
    #     popups = fontSize;
    #     terminal = fontSize;
    #   };
    # };

    # opacity = {
    #   terminal = opacity;
    # };
  };
}
