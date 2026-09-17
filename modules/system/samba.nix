{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.cifs-utils ];

  fileSystems."/mnt/share" = {
    # ... rest of the filesystem config omitted
    device = "//Bubenserver/bubsmb";
    fsType = "cifs";
    options =
      let
        # this line prevents hanging on network split
        automount_opts = "x-systemd.automount,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
      in
      [ "${automount_opts},credentials=/etc/secrets/smb-secrets,uid=1000,gid=100" ];
    # or if you have specified `uid` and `gid` explicitly through NixOS configuration,
    # you can refer to them rather than hard-coding the values:
    # in ["${automount_opts},credentials=/etc/nixos/smb-secrets,uid=${toString config.users.users.<username>.uid},gid=${toString config.users.groups.<group>.gid}"];
  };
}
