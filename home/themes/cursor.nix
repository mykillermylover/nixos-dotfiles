{ pkgs, ... }:
{
  home.pointerCursor = {
    enable = true;

    gtk.enable = true;
    hyprcursor = {
      enable = true;
      size = 24;
    };

    name = "BreezeX-RosePine-Linux";
    package = pkgs.rose-pine-cursor;
    size = 24;

    x11.enable = true;
  };
}
