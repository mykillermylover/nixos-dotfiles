{ ... }:
{
  imports = [
    ./sops.nix
    ./systemd.nix
    ./cursor.nix

    ./apps
    ./hypr
    ./themes
  ];

  home.username = "mihail";
  home.homeDirectory = "/home/mihail";

  xresources.properties = {
    "Xcursor.size" = 24;
  };

  home.stateVersion = "25.05";

  services.network-manager-applet.enable = true;
}
