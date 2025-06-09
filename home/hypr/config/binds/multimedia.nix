{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    ######################
    ## Multimedia Binds ##
    ######################
    bindel = [
      # Laptop multimedia keys for volume and LCD brightness
      ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
      ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
    ];

    bindl = [
      # Player controls
      ", XF86AudioNext,  exec,  mshell next"
      ", XF86AudioPause, exec,  mshell play-pause"
      ", XF86AudioPlay,  exec,  mshell play-pause"
      ", XF86AudioPrev,  exec,  mshell previous"
    ];
  };
}
