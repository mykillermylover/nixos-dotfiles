{ pkgs, ... }:
{
  home.packages = with pkgs; [
    scrcpy
    android-tools
  ];

  xdg.desktopEntries.scrcpy = {
    name = "scrcpy (screen off, physical keyboard)";
    genericName = "Android Remote Control";
    comment = "Android Screen Mirror";
    exec = "${pkgs.scrcpy}/bin/scrcpy -SKw --kill-adb-on-close";
    icon = "scrcpy";
    categories = [
      "Utility"
      "System"
    ];
    terminal = true;
    startupNotify = true;
  };
}
