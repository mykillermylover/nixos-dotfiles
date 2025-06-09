{ inputs, ... }:
{
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
    ./apps
    ./hypr

    ./gtk.nix
    ./xdg.nix
  ];

  home.username = "mihail";
  home.homeDirectory = "/home/mihail";

  xresources.properties = {
    "Xcursor.size" = 24;
  };

  home.stateVersion = "25.05";

  services.network-manager-applet.enable = true;
}
