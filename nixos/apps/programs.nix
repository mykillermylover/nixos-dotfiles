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

    steam = {
      enable = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
      extest.enable = true;
    };
  };
}
