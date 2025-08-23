{ config, lib, pkgs, ... }:

let
  kmscon-conf = pkgs.writeTextDir "kmscon.conf" "${config.services.kmscon.extraConfig}";
in
{
  # Ensure users in group 'tty' can access /dev/tty1
  services.udev.extraRules = ''
    KERNEL=="tty1", SUBSYSTEM=="tty", MODE:="0660"
  '';

  # Greeter
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = ''
          ${pkgs.kmscon}/libexec/kmscon/kmscon --seats=seat0 --no-switchvt --configdir \
          ${kmscon-conf} --login ${config.services.kmscon.extraOptions} --no-reset-env \
          -- ${pkgs.tuigreet}/bin/tuigreet --time --cmd sway
        '';
        user = "root";
      };
    };
  };
}
