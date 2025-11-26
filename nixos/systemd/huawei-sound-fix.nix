# Sound fix for Huawei Matebook S14/16 D14/16. Mb other
# Codec: Codec: Conexant SN6140. Vendor id: 0x14f11f87
# Subsystem id: 0x19e53291

### This is a solution adapted for pipewire and more reliable in detecting plugged-in Jack
### Thanks to original solution: https://github.com/Smoren/huawei-ubuntu-sound-fix

{ pkgs, ... }:

let
  src = pkgs.fetchFromGitHub {
    owner = "mykillermylover";
    repo = "huawei-linux-sound-fix";
    rev = "master";
    sha256 = "sha256-+bICV+qvKRlVTe8ERfZe6tED1tcTy9dliVVoK96TZ3s=";
  };

  huawei-sound-fix = pkgs.stdenv.mkDerivation {
    name = "huawei-sound-fix";
    src = src;
    installPhase = ''
      mkdir -p $out/bin
      chmod +x huawei-soundcard-headphones-monitor.sh
      cp huawei-soundcard-headphones-monitor.sh $out/bin/
    '';
  };
in
{
  systemd.services.huawei-sound-fix = {
    description = "Keep Headphone unmuted on Huawei sof-hda-dsp";
    wantedBy = [ "default.target" ];

    after = [
      "pipewire.service"
      "wireplumber.service"
    ];

    path = with pkgs; [
      alsa-tools
      alsa-utils
      gawk
      procps
    ];

    serviceConfig = {
      ExecStart = "${huawei-sound-fix}/bin/huawei-soundcard-headphones-monitor.sh";
      Restart = "on-failure";
      RestartSec = 1;
    };
  };
}
