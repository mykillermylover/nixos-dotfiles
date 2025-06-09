{ pkgs, lib, ... }:
let
  sddm-astronaut = pkgs.sddm-astronaut.override {
    themeConfig = {
      # AccentColor = "#746385";
      FormPosition = "center";

      # ForceHideCompletePassword = true;
    };
  };
in
{
  services.displayManager = {
    defaultSession = "hyprland";

    sddm = {
      enable = true;
      package = pkgs.kdePackages.sddm;

      settings = {
        Theme.Current = "sddm-astronaut-theme";
      };

      wayland = {
        enable = true;
        # Needs to open sddm 
        # on every display connected 
        # with correct dpi
        compositor = "kwin";
      };

      theme = "sddm-astronaut-theme";

      extraPackages = lib.singleton sddm-astronaut;
    };
  };

  environment.systemPackages = with pkgs; lib.singleton sddm-astronaut;
}
