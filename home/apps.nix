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

    # Thunar
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    xfce.thunar-media-tags-plugin
    xfce.tumbler
    kdePackages.ark

    # theme
    nwg-look
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

  programs.git = {
    enable = true;
    userName = "makulenko";
    userEmail = "makulenko@rvision.ru";
  };

  programs.vim = {
    enable = true;
    settings = {
      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
    };
  };

  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-marketplace; [
      jnoortheen.nix-ide
      alefragnani.project-manager
    ];
  };

  # programs.fish = {
  #   enable = true;
  #   plugins = [
  #     { name = "grc"; src = pkgs.fishPlugins.grc.src; }
  #   ];
  # };

  programs.spicetify =
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      enable = true;

      enabledExtensions = with spicePkgs.extensions; [
        adblock
        hidePodcasts
        shuffle
      ];

      theme = spicePkgs.themes.catppuccin;
      colorScheme = "mocha";
    };
}
