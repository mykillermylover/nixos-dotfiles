{ ... }:
{
  imports = [
    ./git.nix
    ./vscode
    ./spicetify.nix
    ./kitty.nix
    ./btop.nix
    ./neovim.nix
    ./starship.nix
    ./jetbrains-toolbox.nix
    ./zoxide.nix
    ./direnv.nix

    ./packages-list.nix
    ./xdg-mimeapps.nix

    ./fish
    ./firefox
    ./rofi
  ];
}
