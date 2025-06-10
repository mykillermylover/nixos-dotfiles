{ pkgs, inputs, ... }:
{
  home.packages =
    (with pkgs; [
      telegram-desktop
      zip
      unzip
      p7zip
      rofi-wayland
      pavucontrol
      chromium
      networkmanagerapplet
      openvpn
      kdePackages.ark
      fnm

      libsForQt5.qtstyleplugin-kvantum
      libsForQt5.qt5ct
      kdePackages.qt6ct

      # theme
      graphite-kde-theme
      graphite-gtk-theme
      rose-pine-cursor
      # icons
      colloid-icon-theme
      kdePackages.breeze-icons

      # fonts
      meslo-lgs-nf
      nerd-fonts.jetbrains-mono
      nerd-fonts.meslo-lg
      noto-fonts-color-emoji
      noto-fonts

      hyprpolkitagent
      hyprpaper

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
    ])
    ++ (with inputs; [
      rose-pine-hyprcursor.packages.${pkgs.system}.default
      mshell.packages.${pkgs.system}.default
    ])
    # Apps from private config repo
    ++ (with inputs.my-apps.packages.${pkgs.system}; [
      # AppImages
      ktalk
      squadus
    ]);
}
