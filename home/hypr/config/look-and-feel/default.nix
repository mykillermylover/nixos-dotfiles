{ ... }:
{
  #####################
  ### LOOK AND FEEL ###
  #####################

  # Refer to https://wiki.hyprland.org/Configuring/Variables/
  imports = [ 
    ./animations.nix
    ./decoration.nix
    ./general.nix
  ];

  wayland.windowManager.hyprland.settings = {

    # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
    dwindle = {
      pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
      preserve_split = true; # You probably want this
    };

    # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
    master = {
      new_status = "master";
    };

    # https://wiki.hyprland.org/Configuring/Variables/#misc
    misc = {
      force_default_wallpaper = 0; # Set to 0 or 1 to disable the anime mascot wallpapers
      disable_hyprland_logo = true; # If true disables the random hyprland logo / anime girl background. :(
      anr_missed_pings = 1;
    };
  };
}
