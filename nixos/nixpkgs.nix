{ inputs, ... }:
{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [
    inputs.nix-vscode-extensions.overlays.default
  ];
}
