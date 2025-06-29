{ pkgs, ... }:
{
  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    graphics.enable = true;

    firmware = with pkgs; [
      sof-firmware
      alsa-firmware
    ];
  };
}
