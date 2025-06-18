{ ... }:
{
  imports = [ ./overlays.nix ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
