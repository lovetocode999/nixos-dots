{ config, lib, pkgs, ... }:

{
  users.mutableUsers = false;
  users.users.lovetocode999 = {
    isNormalUser = true;
    description = "Ariana Gregg";
    password = "password";
    extraGroups = [
      "wheel" # Enable ‘sudo’ for the user.
      "video" # Allow brightness control
    ];
    shell = pkgs.zsh;
    home = "/home/lovetocode999";
    packages = with pkgs; [
      tree
      love
    ];
  };
}
