{ ... }:
{
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "dracula";
      theme_background = false;
      update_ms = 1500;
    };
  };
}
