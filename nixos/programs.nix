{ pkgs, ... }:
{
  programs.hyprland.enable = true;
  programs.fish.enable = true;
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  programs.thunar = {
    enable = true;

    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
      thunar-media-tags-plugin
      tumbler
    ];
  };
}
