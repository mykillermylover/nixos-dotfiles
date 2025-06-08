{ ... }:
{
  networking = {
    hostName = "nixos"; # Define your hostname.

    # Configure network proxy if necessary
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networkmanager.enable = true;
    nftables.enable = true;
    iproute2.enable = true;

    # Open ports in the firewall.
    firewall = {
      enable = false;

      allowedTCPPorts = [
        # for Spotify
        57621
      ];
      allowedUDPPorts = [
        # for Spotify
        5353
      ];
      checkReversePath = "loose";
    };
  };
}
