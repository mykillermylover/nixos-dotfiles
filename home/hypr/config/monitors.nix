{ globals, lib, ... }:
{
  wayland.windowManager.hyprland.settings =
    with globals.const;
    let
      getMonConfig =
        {
          name,
          res,
          framerate,
          scale,
          position ? "auto",
        }:
        lib.concatStringsSep ", " (
          map toString [
            name
            "${res}@${toString framerate}"
            position
            scale
          ]
        );
    in
    {
      ################
      ### MONITORS ###
      ################

      # See https://wiki.hyprland.org/Configuring/Monitors/
      monitor = [
        (getMonConfig builtInMon)
        (getMonConfig externalMon)
      ];
    };
}
