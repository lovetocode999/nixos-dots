{ config, lib, pkgs, ... }:

{
  imports = [
    ./home/keyboard.nix
    ./home/sway.nix
    ./home/kitty.nix
    ./home/qutebrowser.nix
  ];

  home.packages = with pkgs; [
    aseprite
    wl-clipboard
    grim
    mako
    brightnessctl
  ];

  services.kdeconnect.enable = true;

  home.stateVersion = "25.05";
}
