{ ... }:
{
  imports = [
    ./git.nix
    ./vscode
    ./spicetify.nix
    ./kitty.nix
    ./firefox.nix
    ./btop.nix
    ./neovim.nix

    ./packages-list.nix
    ./xdg-mimeapps.nix

    ./fish
  ];
}
