{ globals, ... }:
{
  services.hyprpaper = {
    enable = true;

    settings = let 
      wallpaper = "~/Shared/Wallpapers/wallpaper.jpg";
    in {
      ipc = true;
      preload = [wallpaper];

      wallpaper = with globals.const; [
        "${externalMon}, ${wallpaper}"
        "${builtInMon}, ${wallpaper}"
      ];
    };
  };
}