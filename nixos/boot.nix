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
    kernelParams = [
      "intel_pstate=active"
      "i915.enable_guc=2" # Enable GuC/HuC firmware loading
      "i915.enable_psr=1" # Panel Self Refresh for power savings
      "i915.enable_fbc=1" # Framebuffer compression
      "i915.fastboot=1" # Skip unnecessary mode sets at boot
      "mem_sleep_default=deep" # Allow deepest sleep states
      "i915.enable_dc=2" # Display power saving
      "nvme.noacpi=1" # Helps with NVME power consumption
    ];

    extraModprobeConfig = ''
      options hid_apple fnmode=0
    '';
  };
}
