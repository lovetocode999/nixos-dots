{ config, lib, pkgs, ... }:

{
  stylix = {
    enable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/caroline.yaml";
    image = ./rayla-new.png;

    fonts = {
      monospace = {
        package = pkgs.monocraft;
	name = "Monocraft nerd font";
      };
      serif = config.stylix.fonts.monospace;
      sansSerif = config.stylix.fonts.monospace;

      sizes = {
        applications = 10;
      };
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Original-Classic";
      size = 20;
    };
  };
}
