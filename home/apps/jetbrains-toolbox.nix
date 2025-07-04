{ pkgs, ... }:
{
  home.packages = [ pkgs.jetbrains-toolbox ];

  xdg.desktopEntries.jetbrains-toolbox = {
    name = "JetBrains Toolbox";
    comment = "JetBrains Toolbox";
    exec = "${pkgs.jetbrains-toolbox}/bin/jetbrains-toolbox";
    icon = "jetbrains-toolbox";
    categories = [
      "Development"
      "IDE"
    ];
    terminal = false;
    startupNotify = true;
  };
}
