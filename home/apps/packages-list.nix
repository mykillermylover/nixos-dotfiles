{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    telegram-desktop
    zip
    unzip
    p7zip
    rofi-wayland
    pavucontrol
    chromium
    networkmanagerapplet
    openvpn

    # Thunar
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    xfce.thunar-media-tags-plugin
    xfce.tumbler
    kdePackages.ark

    # theme
    graphite-kde-theme
    graphite-gtk-theme
    #icons
    colloid-icon-theme
    kdePackages.breeze-icons

    # fonts
    meslo-lgs-nf
    nerd-fonts.jetbrains-mono
    nerd-fonts.meslo-lg
    noto-fonts-color-emoji

    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
    inputs.mshell.packages.${pkgs.system}.default

    fastfetch
    jq
    eza
    fzf
    bat

    dnsutils
    nmap

    file
    which
    gnupg

    nix-output-monitor
    nixfmt-rfc-style

    btop

    usbutils
  ];
}
