{
  config,
  pkgs,
  lib,
  ...
}:

let
  # Fetch the magic-mouse-gestures script from GitHub.
  # We use fetchFromGitHub to pull a specific revision.
  magicMouseGesturesSrc = pkgs.fetchFromGitHub {
    owner = "brenoperucchi";
    repo = "magic-mouse-gestures";
    rev = "master"; # You can pin a specific commit hash here for reproducibility.
    # Replace this with the correct hash. Run:
    # nix-prefetch-url --unpack https://github.com/brenoperucchi/magic-mouse-gestures/archive/master.tar.gz
    # or use lib.fakeSha256 and rebuild to get the correct hash.
    sha256 = "1xax4s7kk1s0wfxmzii5kkwng6yz9ffhcwlkana2gryc9ha4ny18";
  };

  # Build a derivation that installs the Python script into the Nix store.
  magicMouseGestures = pkgs.stdenv.mkDerivation {
    pname = "magic-mouse-gestures";
    version = "unstable";
    src = magicMouseGesturesSrc;

    installPhase = ''
      mkdir -p $out/bin
      cp magic_mouse_gestures.py $out/bin/
      chmod +x $out/bin/magic_mouse_gestures.py
    '';
  };
in
{
  boot.kernelParams = [
    "hid_magicmouse.emulate_3button=0"
    "hid_magicmouse.scroll_acceleration=1"
    "hid_magicmouse.scroll_speed=40"
  ];

  environment.systemPackages = with pkgs; [
    wtype
  ];

  services.udev.extraRules = ''
    KERNEL=="hidraw*", KERNELS=="0005:004C:0269.*", MODE="0666"
  '';

  systemd.user.services.magic-mouse-gestures = {
    description = "Magic Mouse Gestures Driver";
    wantedBy = [ "default.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.python3}/bin/python3 ${magicMouseGestures}/bin/magic_mouse_gestures.py";
      Restart = "on-failure";
      RestartSec = 5;
      # Ensure wtype and bluez tools are available in the service's PATH.
      Environment = "PATH=${pkgs.wtype}/bin:${pkgs.bluez}/bin:${pkgs.bluez-tools}/bin";
    };
  };
}
