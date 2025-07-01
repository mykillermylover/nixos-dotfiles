{ pkgs, ... }:
{
  # Bootloader.
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
      };
      
      efi.canTouchEfiVariables = true;
    };

    # Use latest kernel.
    kernelPackages = pkgs.linuxPackages_latest;

    kernel = {
      sysctl."net.ipv4.ip_forward" = "1";
      sysctl."net.ipv6.conf.all.forwarding" = "1";
    };

    extraModprobeConfig = ''
      options hid_apple fnmode=0
    '';
  };
}
