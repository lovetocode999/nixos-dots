{ config, lib, pkgs, ... }:

{
  /*environment.systemPackages = with pkgs; [
    kmonad
  ];*/

  services.kmonad = {
    enable = true;
    keyboards = {
      laptop = {
        device = "/dev/input/by-path/platform-i8042-serio-0-event-kbd";
        config = builtins.readFile ./kbd/config.kbd;
      };
    };
  };
}
