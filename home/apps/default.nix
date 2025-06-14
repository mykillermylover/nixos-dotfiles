{ ... }:
{
  imports = [
    ./git.nix
    ./vim.nix
    ./vscode.nix
    ./spicetify.nix
    ./kitty.nix
    ./fish.nix
    ./starship.nix
    ./firefox.nix

    ./packages-list.nix
    ./xdg-mimeapps.nix
  ];
}
