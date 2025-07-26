{ pkgs, ... }:
{
  gtk = {
    enable = true;

    iconTheme = {
      name = "Colloid-Dark";
    };
    cursorTheme = {
      name = "BreezeX-RosePine-Linux";
      size = 24;
    };
    theme = {
      name = "Graphite-Dark";
      package = pkgs.graphite-gtk-theme;
    };

    gtk3.extraConfig = { gtk-application-prefer-dark-theme = true; };
    gtk4.extraConfig = { gtk-application-prefer-dark-theme = true; };
  };
}