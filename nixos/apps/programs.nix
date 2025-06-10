{ pkgs, ... }:
{
  programs = {
    hyprland.enable = true;
    fish.enable = true;
    appimage.enable = true;
    appimage.binfmt = true;

    seahorse.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
}
