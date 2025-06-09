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
