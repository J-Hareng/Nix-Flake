{ config, ... }:
{
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
