{ config, lib, pkgs, ... }:

{
  stylix = {
    enable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    image = ./mars.jpeg;

    fonts = {
      #monospace = {
      #  package = pkgs.monocraft;
      #  name = "Monocraft nerd font";
      #};
      monospace = {
        package = pkgs.nerd-fonts.hack;
        name = "Hack Nerd Font Mono";
      };
      #monospace = {
      #  package = pkgs.nerd-fonts.comic-shanns-mono;
      #  name = "ComicShanns Mono Nerd Font Mono";
      #};
      serif = config.stylix.fonts.monospace;
      sansSerif = config.stylix.fonts.monospace;

      sizes = {
        applications = 15;
	desktop = 15;
      };
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Original-Classic";
      size = 32;
    };

    targets.nixvim.enable = false;
  };
}
