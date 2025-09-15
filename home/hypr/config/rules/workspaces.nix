{ globals, ... }:
{
  wayland.windowManager.hyprland.settings = {
    ##################
    ### WORKSPACES ###
    ##################
    # Ref https://wiki.hyprland.org/Configuring/Workspace-Rules/
    workspace = with globals.const; [
      "1, monitor:${builtInMon.name}"
      "3, monitor:${builtInMon.name}"
      "5, monitor:${builtInMon.name}"
      "7, monitor:${builtInMon.name}"
      "9, monitor:${builtInMon.name}"
      "2, monitor:${externalMon.name}"
      "4, monitor:${externalMon.name}"
      "6, monitor:${externalMon.name}"
      "8, monitor:${externalMon.name}"
      "10,monitor:${externalMon.name}"
    ];
  };
}
