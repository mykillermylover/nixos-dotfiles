{ inputs, ... }:
{
  nixpkgs.overlays = with inputs; [
    nix-vscode-extensions.overlays.default
    nix-your-shell.overlays.default
    my-apps.overlays.default
    mshell.overlays.default
  ];
}
