{ config, lib, pkgs, ... }:

{
  # rollback the root to an empty screenshot
  boot.initrd.postResumeCommands = lib.mkAfter ''
    zfs rollback -r zroot/nixos/tmp/root@blank
  '';

  # persist root directories
  environment.persistence."/persist" = {
    hideMounts = true;
    directories = [
      "/etc/nixos"
      "/etc/ssh"
      "/etc/NetworkManager/system-connections"
      "/var/lib/nixos"
      "/var/lib/systemd/coredump"
    ];
  };

  # ensure persisted home directories have correct read-write permissions and
  # ownership
  systemd.tmpfiles.settings."home-directory" = 
    let
      user-read-write = {
        mode = "755";
        user = "lovetocode999";
        group = "users";
        age = "-";
      };
    in
    {
      "${config.users.users.lovetocode999.home}/Documents".d = user-read-write;
      "${config.users.users.lovetocode999.home}/Pictures".d = user-read-write;
      "${config.users.users.lovetocode999.home}/ldjam58".d = user-read-write;
      "${config.users.users.lovetocode999.home}/Projects".d = user-read-write;
      "${config.users.users.lovetocode999.home}/School".d = user-read-write;
    };
}
