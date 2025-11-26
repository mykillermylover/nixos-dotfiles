{ pkgs, ... }:
{
  imports = [
    # SDDM
    ./sddm.nix

    ./tlp.nix
  ];

  services = {
    upower.enable = true;

    v2raya = {
      enable = true;
      cliPackage = pkgs.xray;
    };

    gvfs.enable = true;
    tumbler.enable = true;

    # Configure keymap in X11
    xserver.xkb = {
      layout = "us,ru";
      variant = "";
      options = "grp:win_space_toggle";
    };

    gnome.gnome-keyring.enable = true;
    gnome.gcr-ssh-agent.enable = true;

    blueman.enable = true;

    # throttled.enable = true;
  };
}
