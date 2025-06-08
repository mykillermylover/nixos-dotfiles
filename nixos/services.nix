{ pkgs, ... }:
{
  services = {
    upower.enable = true;

    displayManager = {
      defaultSession = "hyprland";
      
      sddm = {
        enable = true;

        settings = {
          General.DefaultSession = "Hyprland";
        };
        
        wayland.enable = true;

        theme = "sddm-astronaut";
      };
    };

    v2raya = {
      enable = true;
      cliPackage = pkgs.xray;
    };

    gvfs.enable = true;
  };
}
