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
      atlauncher

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
      python3

      bluetuith
      zoxide
      fastfetch
      jq
      eza
      fzf
      bat
      grc
      fd
      sops

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
      nixd

      btop
      usbutils
    ])
    ++ (
      with inputs;
      let
        default =
          {
            packages,
            path ? "default",
            ...
          }:
          packages.${pkgs.system}.${path};

      in
      map default [
        # default rose-pine-hyprcursor
        rose-pine-hyprcursor
        unimatrix

        # Wrapper let pass custom args to shell
        # Like `mshell restart`
        (mshell // { path = "wrapper"; })

        (rofi-tools // { path = "rofi-cliphist"; })
        (my-apps // { path = "ktalk"; })
        (my-apps // { path = "squadus"; })
      ]
    );
  # Apps from private config repo
  # ++ (with inputs.my-apps.packages.${pkgs.system}; [
  #   # AppImages
  #   ktalk
  #   squadus
  # ]);
}
