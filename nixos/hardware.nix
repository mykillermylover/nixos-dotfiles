{ pkgs, ... }:
{
  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;

      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
          Experimental = true;
        };
      };
    };

    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver
        libva
        libva-vdpau-driver
        mesa
        vpl-gpu-rt
        vaapi-intel-hybrid
      ];
    };

    intel-gpu-tools.enable = true;
    enableAllFirmware = true;

    firmware = with pkgs; [
      sof-firmware
      alsa-firmware
    ];
  };
}
