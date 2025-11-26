{ pkgs, ... }:
{
  services.pipewire = {
    enable = true;
    pulse.enable = true;

    alsa = {
      enable = true;
      support32Bit = true;
    };

    wireplumber = {
      enable = true;
    };
    jack.enable = true;

    extraConfig.pipewire = {
      default."clock.allowed-rates" = [
        44100
        48000
      ];
    };
  };
}
