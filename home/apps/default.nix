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

    ./packages-list.nix
    ./xdg-mimeapps.nix
  ];
}
