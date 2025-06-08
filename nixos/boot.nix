{ pkgs, ... }:
{
  # Bootloader.
  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 10;
  };
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.kernel = {
    sysctl."net.ipv4.ip_forward" = "1";
    sysctl."net.ipv6.conf.all.forwarding" = "1";
  };

  boot.extraModprobeConfig = ''
    options hid_apple fnmode=0
  '';
}
