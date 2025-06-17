{ inputs, pkgs, ... }:
let
  mkPlugin = path: (pkgs.callPackage path { });

  hyprXPrimary = mkPlugin ./hyprXprimary.nix;
in
{
  imports = [ ./settings.nix ];

  wayland.windowManager.hyprland.plugins =
    # official plugins list:
    #
    # borders-plus-plus
    # csgo-vulkan-fix
    # hyprbars
    # hyprexpo
    # hyprscrolling
    # hyprtrails
    # hyprwinwrap
    # xtra-dispatchers
    (with inputs.hyprland-plugins.packages.${pkgs.system}; [
    ])
    ++ [
      hyprXPrimary
    ];
}
