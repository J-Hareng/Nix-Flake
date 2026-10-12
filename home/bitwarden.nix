{ config, pkgs, ... }:

{
  # Quick selector
  home.packages = with pkgs; [
    rbw
    rofi-rbw
    wofi
  ];

  xdg.configFile."wofi/style.css".text = ''
    window {
        background-color: #040e0d;
        border: 2px solid #5fc8d4;
        border-radius: 8px;
    }
    #input {
        background-color: #0a1816;
        color: #f5e2c5;
        border: none;
        padding: 8px;
    }
    #entry {
        padding: 6px;
        color: #f5e2c5;
    }
    #entry:selected {
        background-color: #5fc8d4;
        color: #040e0d;
    }
  '';

  home.file.".mozilla/native-messaging-hosts/com.8bit.bitwarden.json".text = ''
    {
      "name": "com.8bit.bitwarden",
      "description": "Bitwarden desktop <-> browser bridge",
      "path": "${config.home.profileDirectory}/bin/bitwarden",
      "type": "stdio",
      "allowed_extensions": [
        "{446900e4-71c2-419f-a6a7-df9c091e268b}"
      ]
    }
  '';
}
