{ ... }:
{
  imports = [
    ./fonts.nix
    ./sops.nix
    ./systemd.nix

    ./apps
    ./hypr
    ./themes
    ./services
    ./ssh.nix
  ];

  home = rec {
    username = "mihail";
    homeDirectory = "/home/${username}";

    stateVersion = "25.05";

    sessionPath = [
      "${homeDirectory}/.local/bin"

      # Deno version manager
      "${homeDirectory}/.dvm/bin"
    ];
  };

  xresources.properties = {
    "Xcursor.size" = 24;
  };
}
