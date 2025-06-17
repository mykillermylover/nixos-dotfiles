{ ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
  };

  imports = [
    ./config
    ./plugins

    ./hyprlock.nix
    ./hypridle.nix
    ./hyprpaper.nix
  ];
}
