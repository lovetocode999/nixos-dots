{ config, lib, pkgs, ... }:

{
  wayland.windowManager.sway = {
    checkConfig = false;
    enable = true;
    wrapperFeatures.gtk = true;
    package = "${pkgs.swayfx}";
    config = rec {
      modifier = "Mod4";
      terminal = "kitty";
      startup = [
      ];
    };
  };
}
