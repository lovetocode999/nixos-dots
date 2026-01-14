{ config, lib, pkgs, ... }:

{
  # Use kmscon instead of agetty on tty2-tty6
  services.kmscon = {
    enable = true;
    useXkbConfig = true;
    hwRender = false; # so kmscon can give up control of the gpu to sway
    extraOptions = "--font-size 22 --no-drm";
  };
  # Configure xkb
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.variant = "intl";
}
