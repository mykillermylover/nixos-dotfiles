{ ... }:
{
  imports = [ 
    # auto-generated
    ./hardware-configuration.nix
    
    # TODO: split into modules
    ./configuration.nix

    ./networking.nix
    ./services.nix
    ./hardware.nix

    ./environment
  ];
}