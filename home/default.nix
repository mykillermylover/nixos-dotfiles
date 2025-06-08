{ inputs, ... }:
{
  imports = [
    ./home.nix

    inputs.spicetify-nix.homeManagerModules.default
    ./apps.nix

    ./gtk.nix
  ];
}