{ pkgs, ... }:
let
  src = pkgs.fetchFromGitHub {
    owner = "Smoren";
    repo = "huawei-ubuntu-sound-fix";
    rev = "master";
    sha256 = "sha256-3JYbyDzGbIhu9C5T4CEltpiZW6HAuituuDD/taSPkU8=";
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
    wantedBy = [ "multi-user.target" ];
    description = "Huawei soundcard headphones monitor";

    path = with pkgs; [
      alsa-utils
      alsa-tools
      procps
    ];
    serviceConfig = {
      ExecStart = "${huawei-sound-fix}/bin/huawei-soundcard-headphones-monitor.sh";
      User = "root";
      Restart = "always";
    };
  };
}
