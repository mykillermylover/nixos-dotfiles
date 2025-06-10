{ pkgs, ... }:
{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    curl
    git
    tree
    firefox
    kitty
    brightnessctl

    nix-your-shell

    # Default themes
    adwaita-icon-theme
    adwaita-icon-theme-legacy
    adwaita-fonts
  ];
}
