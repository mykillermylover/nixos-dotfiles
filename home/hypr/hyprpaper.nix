{ ... }:
{
  services.hyprpaper = {
    enable = true;

    settings = let 
      wallpaper = "~/Shared/Wallpapers/wallpaper.jpg";
    in {
      ipc = true;
      preload = [wallpaper];

      wallpaper = [
        "HDMI-A-1, ${wallpaper}"
        "eDP-1, ${wallpaper}"
      ];
    };
  };
}