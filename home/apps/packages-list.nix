{
  pkgs,
  inputs,
  ...
}:
{
  home.packages =
    (with pkgs; [
      telegram-desktop
      rofi-wayland
      pavucontrol
      networkmanagerapplet
      openvpn
      kdePackages.ark
      fnm
      qbittorrent-enhanced
      python3
      chromium
      prismlauncher
      google-chrome

      # theme
      graphite-kde-theme
      graphite-gtk-theme
      rose-pine-cursor
      libsForQt5.qtstyleplugin-kvantum
      libsForQt5.qt5ct
      kdePackages.qt6ct

      # icons
      colloid-icon-theme
      kdePackages.breeze-icons

      # fonts
      meslo-lgs-nf
      nerd-fonts.jetbrains-mono
      nerd-fonts.meslo-lg
      noto-fonts-color-emoji
      noto-fonts

      # hypr
      hyprpolkitagent
      hyprpaper
      hyprpicker
      hyprshot

      # utils
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
      bemoji
      usbutils
      dnsutils
      nmap
      file
      which
      gnupg
      swappy
      zip
      unzip
      p7zip
      # nix utils
      nix-output-monitor
      nixfmt-rfc-style
      nixd

      # clipboard
      cliphist
      wl-clipboard
    ])
    ++ (
      with inputs;
      let
        default =
          {
            packages,
            name ? "default",
            ...
          }:
          packages.${pkgs.system}.${name};

      in
      map default [
        # default rose-pine-hyprcursor
        rose-pine-hyprcursor
        unimatrix

        # Wrapper let pass custom args to shell
        # Like `mshell restart`
        (mshell // { name = "wrapper"; })

        (rofi-tools // { name = "rofi-cliphist"; })
        (my-apps // { name = "ktalk"; })
        (my-apps // { name = "squadus"; })
      ]
    );
}
