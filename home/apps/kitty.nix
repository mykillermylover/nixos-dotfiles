{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;

    font = {
      name = "MesloLGS Nerd Font";
      package = pkgs.meslo-lgs-nf;
      size = 12;
    };

    shellIntegration.enableFishIntegration = true;

    settings = {
      # Colors
      color0 = "#222222";
      color1 = "#F01818";
      color2 = "#24D830";
      color3 = "#F0D824";
      color4 = "#7890F0";
      color5 = "#F078D8";
      color6 = "#54E4E4";
      color7 = "#A5A5A5";
      color8 = "#888888";
      color9 = "#EF8383";
      color10 = "#7ED684";
      color11 = "#EFE28B";
      color12 = "#B3BFEF";
      color13 = "#EFB3E3";
      color14 = "#9CE2E2";
      color15 = "#FFFFFF";
      background = "#0d1618";
      foreground = "#FDFDFD";
      cursor = "#FDFDFD";

      background_opacity = 0.75;

      window_padding_width = "5 10";

      # Cursor
      cursor_shape = "beam";
      cursor_beam_thickness = 1.5;
      cursor_blink_interval = "0.33 cubic-bezier(.17,.67,.83,.67)";
      cursor_trail = 150;
      cursor_trail_decay = "0.5 0.7";
      cursor_trail_start_threshold = 30;

      remote_control_password = "kitty_fish_notifications_password ls";
      allow_remote_control = "password";
    };

    keybindings = {
      "ctrl+k" = "combine : clear_terminal active : send_text normal \\x0c";
    };
  };
}
