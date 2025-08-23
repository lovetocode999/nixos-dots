{ config, lib, pkgs, ... }:

{
  imports = [
    ./home/keyboard.nix
    ./home/sway.nix
    ./home/kitty.nix
  ];

  home.packages = with pkgs; [
    qutebrowser
    wl-clipboard
    grim
    mako
    brightnessctl
  ];

  home.stateVersion = "25.05";
}
