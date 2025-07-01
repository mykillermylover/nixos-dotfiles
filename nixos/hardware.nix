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

    graphics.enable = true;

    firmware = with pkgs; [
      sof-firmware
      alsa-firmware
    ];
  };
}
