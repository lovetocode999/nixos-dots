{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./home/keyboard.nix
    ./home/sway.nix
    ./home/kitty.nix
    ./home/qutebrowser.nix
    ./home/zsh.nix
    inputs.dms.homeModules.dankMaterialShell.default
  ];

  home.packages = with pkgs; [
    aseprite
    brightnessctl
    grim
    mako
    pulsemixer
    wl-clipboard
  ];

  programs.obsidian.enable = true;

  programs.dankMaterialShell = {
    enable = true;
    systemd = {
      enable = true;
      restartIfChanged = true;
    };
  };

  services.kdeconnect.enable = true;

  home.stateVersion = "25.05";
}
