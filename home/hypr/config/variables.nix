{ globals, ... }:
{
  wayland.windowManager.hyprland.settings = with globals.const; {
    #################
    ### VARIABLES ###
    #################

    ## Keybind variables
    "$mainMod" = "SUPER"; # Sets "Windows" key as main modifier
    "$shiftMod" = "SUPER_SHIFT";
    "$ctrlMod" = "SUPER_CTRL";

    ## Monitors
    "$builtInMon" = builtInMon;
    "$externalMon" = externalMon;

    ## Programs
    "$terminal" = "kitty";
    "$browser" = "firefox";
    "$fileManager" = "thunar";
    "$menu" = "rofi -show drun";
    "$screenshot" = "hyprshot --mode=region --freeze --raw | swappy -f -";
    # clipboard manager, copying and outputs chosen entry
    "$clipboardManager" = "rofi-cliphist";
    "$colorPicker" = "hyprpicker -a";
    "$emojiPicker" = "bemoji -nct -f ~/.local/share/bemoji/all.txt";
  };
}
