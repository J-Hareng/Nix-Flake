{ pkgs, ... }:
{

  home.packages = [
    (pkgs.mailspring.overrideAttrs (old: {
      postFixup = (old.postFixup or "") + ''
        sed -i 's|Exec=.*mailspring.*|& --password-store="gnome-libsecret"|' $out/share/applications/Mailspring.desktop
      '';
    }))
  ];
}
