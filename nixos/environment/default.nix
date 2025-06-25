{ ... }:
{
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    BROWSER = "firefox";
    TERMINAL = "kitty";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_STYLE_OVERRIDE = "kvantum";
    # SSH_AUTH_SOCK = "$XDG_RUNTIME_DIR/gcr/ssh";
  };
}
