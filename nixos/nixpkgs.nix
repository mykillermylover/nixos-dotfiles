{ inputs, ... }:
{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = with inputs; [
    nix-vscode-extensions.overlays.default
    nix-your-shell.overlays.default
  ];
}
