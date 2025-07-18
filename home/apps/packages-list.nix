{
  pkgs,
  inputs,
  ...
}:
{
  home.packages =
    (with pkgs; [
      telegram-desktop
      pavucontrol
      networkmanagerapplet
      openvpn
      kdePackages.ark
      fnm
      qbittorrent-enhanced
      python3
      chromium
      (prismlauncher.override { glfw3-minecraft = glfw-minecraft-wayland; })
      google-chrome
      onlyoffice-desktopeditors

      arduino-ide

      # Apps from local repo
      ktalk
      squadus
      # in nixpkgs old version
      lens

      # My ags shell
      # Wrapper let pass custom args to shell
      # Like `mshell restart`
      mshell-wrapped

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
      rar
      killall
      desktop-file-utils

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

        (rofi-tools // { name = "rofi-cliphist"; })
      ]
    );
}
