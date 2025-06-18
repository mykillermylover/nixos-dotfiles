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
    ./starship.nix
    ./zoxide.nix
    ./direnv.nix

    ./packages-list.nix
    ./xdg-mimeapps.nix

    ./fish
  ];
}
