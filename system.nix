{ config, lib, pkgs, ... }:

{
  imports = [ ./lib/zfsbootmenu.nix ];

  # bootloader config
  boot.loader.zfsbootmenu = {
    enable = true;
    bootfs = "zroot/nixos/persist/kernels";
    bootdir = "/kernels/boot";
  };

  # Fix security issues while rebuilding in a chroot
  services.logrotate.checkConfig = true;

  # Host information
  networking.hostName = "dipper";
  networking.hostId = "b11f2e76";

  # Wifi
  #networking.wireless.iwd.enable = true;
  networking.networkmanager.enable = true;
  #networking.networkmanager.wifi.backend = "iwd";

  # Firewall
  networking.firewall = rec {
    allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
    allowedUDPPortRanges = allowedTCPPortRanges;
  };

  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
    settings = {
      General = {
        ControllerMode = "bredr";
	Experimental = true;
      };
    };
  };

  # Time zone
  time.timeZone = "America/Denver";

  # Audio
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Default system shell
  programs.zsh.enable = true;

  # System-wide packages
  environment.systemPackages = with pkgs; [
    acpi
    git
    htop
    neovim
    wget
  ];
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "aseprite"
    ];

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  security.polkit.enable = true;

  # Enable some experimental features
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.05";
}
