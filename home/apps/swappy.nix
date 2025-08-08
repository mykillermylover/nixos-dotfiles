{ lib, pkgs, ... }:
{
  home.file.".config/swappy/config".text = lib.generators.toINI { } {
    "Default" = {
      save_dir = "$HOME/Pictures/Screenshots";
      save_filename_format = "screenshot_%Y-%m-%dT%H:%M:%S%z.png";
      show_panel = true;
      line_size = 4;
      text_size = 20;
      text_font = "sans-serif";
      paint_mode = "arrow";
      early_exit = true;
      fill_shape = false;
      custom_color = "rgba(207, 18, 31, 1)";
    };
  };

  home.packages = lib.singleton pkgs.swappy;
}
