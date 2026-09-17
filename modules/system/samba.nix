{ pkgs, lib, ... }:
{
  environment.systemPackages = [
    pkgs.cifs-utils
    pkgs.samba
  ];

  security.wrappers."mount.cifs" = {
    program = "mount.cifs";
    source = "${lib.getBin pkgs.cifs-utils}/bin/mount.cifs";
    owner = "root";
    group = "root";
    setuid = true;
  };

  fileSystems."/mnt/share" = {
    device = "//Bubenserver/bubsmb";
    fsType = "cifs";
    options =
      let
        # this line prevents hanging on network split
        automount_opts = "noauto,x-systemd.automount,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
      in
      [ "${automount_opts},x-gvfs-show,credentials=/etc/secrets/smb-secrets,uid=1000,gid=100" ];
  };
}
