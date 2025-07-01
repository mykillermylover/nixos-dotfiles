{ pkgs, ... }:
{
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [
        "JetBrainsMono Nerd Font"
        "MesloLGS Nerd Font"
      ];
      emoji = [
        "Noto Color Emoji"
      ];
    };
  };

  home.packages = with pkgs; [
    noto-fonts
    corefonts
    vistafonts
    noto-fonts-color-emoji
    meslo-lgs-nf
    nerd-fonts.meslo-lg
    nerd-fonts.jetbrains-mono
  ];
}
