{
  pkgs,
  lib,
  ...
}:
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
        Theme = {
          Current = "sddm-astronaut-theme";
          CursorTheme = "BreezeX-RosePine-Linux";
          CursorSize = 24;
        };
        General = {
          GreeterEnvironment = "QT_WAYLAND_SHELL_INTEGRATION=layer-shell,XCURSOR_THEME=BreezeX-RosePine-Linux,XCURSOR_SIZE=24";
        };
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
