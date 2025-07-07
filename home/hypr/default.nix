{ ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
  };

  imports = [
    ./config

    ./hyprlock.nix
    ./hypridle.nix
    ./hyprpaper.nix
  ];
}
