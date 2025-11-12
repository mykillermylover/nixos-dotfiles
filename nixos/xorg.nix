{ globals, ... }:
{
  services.xserver = {
    enable = true;
    videoDrivers = [
      "intel"
    ]; # или ваши драйверы

    xrandrHeads = with globals.const; [
      {
        output = externalMon.name;
        primary = true;
      }
      {
        output = builtInMon.name;
      }
    ];
  };
}
