{ ... }:
{
  wayland.windowManager.hyprland.settings = {

    ###############
    ### WINDOWS ###
    ###############

    # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more

    windowrule = [
      # Example windowrule
      # "float,class:^(kitty)$,title:^(kitty)$"

      # Ignore maximize requests from apps. You'll probably like this.
      "suppressevent maximize, class:^(.*)$"

      # Open jetbrains apps on 4 workspace
      # "noinitialfocus, class:^(jetbrains-.*)$"
      # "workspace 4, class:^(jetbrains-.*)$"
      # "stayfocused, class:^(jetbrains-.*)$"

      # Picture-in-Picture
      "float, title:^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$"
      "keepaspectratio, title:^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$"
      "move 73% 72%, title:^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$ "
      "size 25%, title:^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$"
      "float, title:^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$"
      "pin, title:^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$"

      # Dialog windows – float+center these windows.
      # Center:
      "center, title:^(Open File)(.*)$"
      "center, title:^(Select a File)(.*)$"
      "center, title:^(Choose wallpaper)(.*)$"
      "center, title:^(Open Folder)(.*)$"
      "center, title:^(Save As)(.*)$"
      "center, title:^(Library)(.*)$"
      "center, title:^(File Upload)(.*)$"
      "center, title:^(File Operation Progress)(.*)$"
      "center, title:^(Rename)(.*)$"
      "center, class:^(xdg-desktop-portal-gtk)$"
      "center, class:^(nm-connection-editor)$, title:^(Editing)(.*)$"
      
      # Float:
      "float,  title:^(Open File)(.*)$"
      "float,  title:^(Select a File)(.*)$"
      "float,  title:^(Choose wallpaper)(.*)$"
      "float,  title:^(Open Folder)(.*)$"
      "float,  title:^(Save As)(.*)$"
      "float,  title:^(Library)(.*)$"
      "float,  title:^(File Upload)(.*)$"
      "float,  title:^(File Operation Progress)(.*)$"
      "float,  title:^(Rename)(.*)$"
      "float,  class:^(xdg-desktop-portal-gtk)$"
      "float,  class:^(nm-connection-editor)$, title:^(Editing)(.*)$"

      # Obsidian
      "opacity 0.999999, initialClass:obsidian"
    ];
  };
}
