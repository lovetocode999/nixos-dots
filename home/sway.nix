{ config, lib, pkgs, ... }:

{
  imports = [
    ./sway/i3status.nix
  ];
  wayland.windowManager.sway = {
    checkConfig = false;
    enable = true;
    wrapperFeatures.gtk = true;
    package = "${pkgs.swayfx}";
    xwayland = true;
    config = rec {
      input = {
        "type:keyboard" = {
	  xkb_layout = "us(workman)";
	};
      };
      output = {
        eDP-1 = {
	  scale = "1";
	};
      };
      modifier = "Mod4";
      terminal = "kitty";
      gaps.inner = 10;
      bars = [
        ({
	  statusCommand = "${lib.getExe pkgs.i3status}";
	  position = "top";
	} // config.stylix.targets.sway.exportedBarConfig)
      ];
      startup = [
      ];
    };
  };
}
