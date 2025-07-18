{ globals, ... }:
{
  services.xserver = {
    enable = true;
    videoDrivers = [
      "intel"
    ]; # или ваши драйверы

    xrandrHeads = with globals.const; [
      {
        output = externalMon;
        primary = true;
      }
      builtInMon
    ];
  };
}
