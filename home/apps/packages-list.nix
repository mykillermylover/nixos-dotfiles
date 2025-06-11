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
      qbittorrent-enhanced

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
      hyprpicker
      hyprshot
      swappy

      fastfetch
      jq
      eza
      fzf
      bat
      grc
      fd

      cliphist
      wl-clipboard
      bemoji

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
      # Wrapper let pass custom args to shell
      # Like `mshell restart`
      mshell.packages.${pkgs.system}.wrapper

      rofi-tools.packages.${pkgs.system}.rofi-cliphist
    ])
    # Apps from private config repo
    ++ (with inputs.my-apps.packages.${pkgs.system}; [
      # AppImages
      ktalk
      squadus
    ]);
}
