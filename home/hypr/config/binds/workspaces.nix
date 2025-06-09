{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      ########################
      ### WORKSPACES BINDS ###
      ########################

      "$mainMod, F11, fullscreen, 0"

      # Switch workspaces with mainMod + [0-9]
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      "$shiftMod, 1, movetoworkspace, 1"
      "$shiftMod, 2, movetoworkspace, 2"
      "$shiftMod, 3, movetoworkspace, 3"
      "$shiftMod, 4, movetoworkspace, 4"
      "$shiftMod, 5, movetoworkspace, 5"
      "$shiftMod, 6, movetoworkspace, 6"
      "$shiftMod, 7, movetoworkspace, 7"
      "$shiftMod, 8, movetoworkspace, 8"
      "$shiftMod, 9, movetoworkspace, 9"
      "$shiftMod, 0, movetoworkspace, 10"

      # Move active window to a workspace silently with mainMod + CTRL + [0-9]
      "$ctrlMod, 1, movetoworkspacesilent, 1 "
      "$ctrlMod, 2, movetoworkspacesilent, 2 "
      "$ctrlMod, 3, movetoworkspacesilent, 3 "
      "$ctrlMod, 4, movetoworkspacesilent, 4 "
      "$ctrlMod, 5, movetoworkspacesilent, 5 "
      "$ctrlMod, 6, movetoworkspacesilent, 6 "
      "$ctrlMod, 7, movetoworkspacesilent, 7 "
      "$ctrlMod, 8, movetoworkspacesilent, 8 "
      "$ctrlMod, 9, movetoworkspacesilent, 9 "
      "$ctrlMod, 0, movetoworkspacesilent, 10"

      # Example special workspace (scratchpad)
      "$mainMod,  U, togglespecialworkspace"
      "$shiftMod, U, movetoworkspace,       special"
      "$ctrlMod , U, movetoworkspacesilent, special"

      # Scroll through existing workspaces with mainMod + scroll
      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"
    ];
  };
}
