{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      ###################
      ## Windows Binds ##
      ###################

      # Move focus with mainMod + arrow keys
      "$mainMod, left, movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up, movefocus, u"
      "$mainMod, down, movefocus, d"

      ## MOVE WINDOWS ##
      # With focus
      "$shiftMod, left,  movewindow, l"
      "$shiftMod, right, movewindow, r"
      "$shiftMod, up,    movewindow, u"
      "$shiftMod, down,  movewindow, d"
      # Without focus
      "$ctrlMod, left,  movewindow, l silent"
      "$ctrlMod, right, movewindow, r silent"
      "$ctrlMod, up,    movewindow, u silent"
      "$ctrlMod, down,  movewindow, d silent"

      "$mainMod, P, pseudo," # dwindle
      "$mainMod, J, togglesplit," # dwindle
      "$mainMod, Q, killactive,"
      "$mainMod, F, togglefloating,"
    ];

    bindm = [
      # Move/resize windows with mainMod + LMB/RMB and dragging
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];
  };
}
