{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    # Apps binds
    bind = [
      "$mainMod, T, exec, $terminal"
      "$mainMod, E, exec, $fileManager"
      "$mainMod, B, exec, $browser"
      "$mainMod, R, exec, $menu"
      "$shiftMod, S, exec, $screenshot"

      # Copy and type message from clipboard
      "$mainMod, V, exec, $clipboardManager"
      "$mainMod, code:60, exec, $emojiPicker"
      "$shiftMod, C, exec, $colorPicker"
      
      "$mainMod, L, exec, hyprlock"
    ];
  };
}
