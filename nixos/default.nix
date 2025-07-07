{ ... }:
{
  imports = [
    # auto-generated
    ./hardware-configuration.nix

    ./boot.nix
    ./hardware.nix
    ./networking.nix
    ./nix.nix
    ./users.nix
    ./time-locale.nix
    ./virtualization.nix
    ./security.nix
    ./xorg.nix

    ./apps
    ./environment
    ./nixpkgs
    ./services
    ./systemd
    ./sound
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
