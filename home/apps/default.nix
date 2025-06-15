{ ... }:
{
  imports = [
    ./git.nix
    ./vscode.nix
    ./spicetify.nix
    ./kitty.nix
    ./firefox.nix
    ./btop.nix

    ./packages-list.nix
    ./xdg-mimeapps.nix

    ./fish
    ./neovim
  ];
}
